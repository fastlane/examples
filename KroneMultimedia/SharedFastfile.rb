$slack_hook = 'https://hooks.slack.com/'
$cert_repo = 'ssh://git@host/mobile/IOS-CERTIFICATES.git'

lane :before_build do
  clear_derived_data
  increment_build_number(build_number: latest_testflight_build_number + 1)
  cocoapods
  unlock_keychain
end

lane :badge do
  badge(shield: ENV['CI_BUILD_REF_NAME'], no_badge: true)
end
desc 'Run Unit/UI Tests'
lane :snapshots do
  tests
  #### PLACE FOR AWS
end

lane :run_on_device_release do
  # on release build we disable NSLog and set CMD_LINE_BUILD
  run_on_device_sub(xcargs: "GCC_PREPROCESSOR_DEFINITIONS='CMD_LINE_BUILD'")
end
lane :run_on_device_development do
  run_on_device_sub(xcargs: '')
end

private_lane :slack_team do |options|
  slack(slack_url: $slack_hook,
        message: "APP: #{$self_idfs.first} #{options[:message]}",
        success: options[:success]
       )
end

private_lane :run_on_device_sub do |options|
  before_build
  gym(scheme: $self_scheme,
      clean: true,
      workspace: $self_workspace,
      silent: true,
      buildlog_path: 'fastlane/logs',
      xcargs: options[:xcargs],
      output_name: 'dev.ipa')
  sh 'ios-deploy --debug --bundle ../dev.ipa || :'
end

desc 'Kill Simulator'
lane :kill_simulator do
  sh 'killall iOS Simulator &> /dev/null || true'
end

desc 'Run Unit/UI Tests'
lane :tests do
  certificates
  before_build
  kill_simulator
  snapshot(workspace: $self_workspace,
           scheme: $self_scheme,
           devices: ['iPhone 6'],
           languages: ['en-US'],
           clear_previous_screenshots: true,
           reinstall_app: true,
           clean: true,
           buildlog_path: 'fastlane/logs',
           skip_open_summary: true)
  sh 'cat logs/*|xcpretty --report html --output logs/test_report.html  -t 2>&1 >> /dev/null'
  kill_simulator
end

lane :certificates do
  $self_idfs.each do |idf|
    match(git_url: $cert_repo,
          type: 'development',
          app_identifier: idf)

    match(git_url: $cert_repo,
          type: 'appstore',
          app_identifier: idf)
  end
end

lane :build_ipa do
  before_build
  certificates

  gym(scheme: $self_scheme,
      clean: true,
      workspace: $self_workspace,
      silent: true,
      xcargs: "GCC_PREPROCESSOR_DEFINITIONS='CMD_LINE_BUILD'",
      buildlog_path: 'fastlane/logs')
end

lane :upload_testflight do
  pilot(skip_submission: true)
end

lane :testflight do
  build_ipa
  upload_testflight
end

lane :bump_version do
  require 'spaceship'
  ensure_git_status_clean

  Spaceship::Tunes.login
  app = Spaceship::Tunes::Application.find($self_idfs[0])
  version_nr = prompt(text: 'New Version number?')
  if version_nr != 'SKIP'
    app.create_version!(version_nr)
    increment_version_number(version_number: version_nr)
    commit_version_bump(message: "Version Bump!! to #{version_nr}")

    # enable testflight testing in newly created version
    version = app.edit_version
    version.can_beta_test = true
    version.save!
  end
end

lane :submit_build do |options|
  require 'spaceship'
  Spaceship::Tunes.login
  app = Spaceship::Tunes::Application.find($self_idfs[0])

  version = app.edit_version

  # get latest build
  use_build = version.candidate_builds.first

  # OR With this one set a specific
  # get specific build

  if options[:build_number]
    puts "Using fixed nr: #{options[:build_number]}"
    use_build = version.candidate_builds.find(build_version: options[:build_number]).first
  end

  puts "Using #{use_build}"

  version.select_build(use_build)

  release_notes = prompt(text: 'Release Notes (end with END):', multi_line_end_keyword: 'END')

  version.release_on_approval = true
  version.can_beta_test = true
  version.release_notes['de-DE'] = release_notes
  version.save!

  submission = app.create_submission
  # Set app submission information
  submission.content_rights_contains_third_party_content = true
  submission.content_rights_has_rights = true

  submission.export_compliance_available_on_french_store = false
  submission.export_compliance_contains_proprietary_cryptography = false
  submission.export_compliance_contains_third_party_cryptography = false
  submission.export_compliance_is_exempt = false
  submission.export_compliance_uses_encryption = false
  submission.export_compliance_app_type = nil
  submission.export_compliance_encryption_updated = false
  submission.export_compliance_compliance_required = false
  submission.export_compliance_platform = 'ios'
  submission.content_rights_contains_third_party_content = true
  submission.content_rights_has_rights = true
  submission.add_id_info_limits_tracking = true
  submission.add_id_info_serves_ads = true
  submission.add_id_info_tracks_action = true
  submission.add_id_info_tracks_install = true
  submission.add_id_info_uses_idfa = true

  # Finalize app submission
  submission.complete!

  puts "Submitted Version: #{version.version}"
  # force a new Version Bump
  puts 'Now create a new Version'
  bump_version

  slack_team(success: true, message: "Build submitted - to APP Store - Version: #{use_build.train_version} #{use_build.build_version}")
end

###
# ANDROID Lanes
####
lane :android_before_build do
  gradle(task: 'clean')
end
lane :android_lib_outdated do
  gradle(task: 'dependencyUpdates',
         flags: '-Drevision=release')
end

private_lane :android_test_on_single_dev do |options|
  adb(flags: 'shell input keyevent 82', serial: options[:serial])
  # uninstall existing app
  adb(flags: 'shell pm uninstall -k #{$self_idfs[0]}', serial: options[:serial])

  # clear logcat
  adb(flags: 'logcat -c', serial: options[:serial])
  # run tests
  gradle(task: 'connectedDebugAndroidTest',
         serial: options[:serial])

  # grab robotium screenshots
  adb(flags: 'pull /storage/sdcard0/Robotium-Screenshots/ app/build/reports/androidTests/connected/screenshots', serial: options[:serial])
  # on some devices the sdcard is somwhere else
  adb(flags: 'pull /sdcard/Robotium-Screenshots/ app/build/reports/androidTests/connected/screenshots', serial: options[:serial])

  # export logcat to textfile
  adb(flags: 'logcat -d > app/build/reports/androidTests/connected/logcat.txt', serial: options[:serial])

  # turn of screen

  adb(flags: 'shell input keyevent 26', serial: options[:serial])
end
private_lane :android_restart_adb do
  adb(flags: 'kill-server')
  adb(flags: 'start-server')
end

lane :android_test do
  require 'fileutils'
  android_restart_adb
  devs = adb_devices
  fail 'No Device Connected' if devs.empty?
  devs.each do |device|
    model = adb(flags: 'shell getprop ro.product.model', serial: device.serial).strip
    puts "Device - #{device.serial} - Model: #{model}"
    android_test_on_single_dev(serial: device.serial)

    FileUtils.mkdir_p("../app/build/reports/#{model}")
    FileUtils.cp_r('../app/build/reports/androidTests', "../app/build/reports/#{model}")
    FileUtils.rm_rf('../app/build/reports/androidTests')
  end
end

lane :android_aws do
  gradle(task: 'devicefarmUpload')
end

lane :android_production do
  android_apkrelease(track: 'production')
end
lane :android_beta do
  android_apkrelease(track: 'beta')
end

lane :android_apkrelease do |options|
  android_before_build
  gradle(task: 'assembleRelease')
  supply(key: 'fastlane/google_play_key.p12',
         track: options[:track])

  if options[:track] == 'production'
    slack_team(success: true, message: 'Build submitted - to Play Store - Production')
  end
end

lane :review_state do
  require 'spaceship'
  Spaceship::Tunes.login
  app = Spaceship::Tunes::Application.find($self_idfs[0])
  version = app.edit_version
  status =  version.raw_status

  case status
  when 'waitingForReview'
    UI.important "App: #{app.bundle_id} is in  Waiting for Review"
  when 'readyForSale'
    UI.success "App: #{app.bundle_id} is in  Ready for Sale"
  when 'prepareForUpload'
    UI.important "App: #{app.bundle_id} is waiting for upload"
  else
    UI.error "App: #{app.bundle_id} is in #{status}"
  end
end

# You can define as many lanes as you want

after_all do |lane|
end

error do |_lane, exception|
  slack_team(success: false, message: exception.to_s)
end

