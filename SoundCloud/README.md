fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios install_xcode
```
fastlane ios install_xcode
```
Install the Xcode version used by SoundCloud
### ios install_pods
```
fastlane ios install_pods
```
Install pod dependencies
### ios appcode_prefs
```
fastlane ios appcode_prefs
```
Update your AppCode preferences with the project ones
### ios setup
```
fastlane ios setup
```
Local setup required to work with the iOS project
### ios update_devices
```
fastlane ios update_devices
```
Update the devices with the ones in devices.txt
### ios dev_certificates_fetch
```
fastlane ios dev_certificates_fetch
```
Fetches the development certificates and provisioning profiles to run the project on real devices
### ios dist_certificates_fetch
```
fastlane ios dist_certificates_fetch
```
Fetches the distribution certificates and provisioning profiles compile the app for AppStore distribution
### ios dev_certificates_update
```
fastlane ios dev_certificates_update
```
Updates the development provisioning profiles
### ios dist_certificates_update
```
fastlane ios dist_certificates_update
```
Updates the distribution provisioning profiles
### ios unit_tests
```
fastlane ios unit_tests
```
Runs unit tests
### ios acceptance_tests
```
fastlane ios acceptance_tests
```
Run acceptance tests
### ios danger
```
fastlane ios danger
```
Executes Danger
### ios ci_acceptance
```
fastlane ios ci_acceptance
```

### ios ci_master
```
fastlane ios ci_master
```

### ios ci_release
```
fastlane ios ci_release
```

### ios ci_pr
```
fastlane ios ci_pr
```

### ios ci_pr_specs
```
fastlane ios ci_pr_specs
```

### ios ci_deploy_appstore
```
fastlane ios ci_deploy_appstore
```

### ios build_debug
```
fastlane ios build_debug
```
Build the project with Debug configuration
### ios build_release
```
fastlane ios build_release
```
Build the project with Release configuration
### ios build_frank
```
fastlane ios build_frank
```
Build the project using Frank
### ios deploy_appstore
```
fastlane ios deploy_appstore
```
Deploy the app to the AppStore (use this only on CI)

----

This README.md is auto-generated and will be re-generated every time to run [fastlane](https://fastlane.tools).
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).
