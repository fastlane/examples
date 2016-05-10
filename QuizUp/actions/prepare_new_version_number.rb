module Fastlane
  module Actions
    module SharedValues
      NEW_VERSION = :NEW_VERSION
    end

    class PrepareNewVersionNumberAction < Action
      def self.run(params)
        folder = params[:xcodeproj] ? File.join('.', params[:xcodeproj], '..') : '.'

        command_prefix = [
          'cd',
          File.expand_path(folder).shellescape,
          '&&'
        ].join(' ')

        current_version = Actions::GetVersionNumberAction.run(xcodeproj: "QuizUp.xcodeproj")

        first_number = Integer(current_version[0])
        second_number = Integer(current_version[2])
        third_number = Integer(current_version[4])

        if third_number == 9 then
          new_version = "%i.%i.%i" % [first_number, second_number + 1, 0]
        else
          new_version = "%i.%i.%i" % [first_number, second_number, third_number + 1]
        end

        new_version_with_build_number = "%s.0" % [new_version]

        Helper.log.info "Changed version number to #{new_version}".green

        command = [
          command_prefix,
          "agvtool new-marketing-version #{new_version}"
        ].join(' ')

        Actions.sh command

        Actions::IncrementBuildNumberAction.run(build_number: new_version_with_build_number)

        Actions.lane_context[SharedValues::NEW_VERSION] = new_version
      end


      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Increment the version number after submitting"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :xcodeproj,
                                       env_name: "FL_PREPARE_NEW_VERSION_PROJECT",
                                       description: "optional, you must specify the path to your main Xcode project if it is not in the project root directory",
                                       optional: true,
                                       verify_block: Proc.new do |value|
                                        raise "Please pass the path to the project, not the workspace".red if value.include?"workspace"
                                        raise "Could not find Xcode project".red if (not File.exists?(value) and not Helper.is_test?)
                                       end)
        ]
      end

      def self.output
        [
          ['NEW_VERSION', 'The new version number']
        ]
      end

      def self.authors
        ["hilmarbirgir"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
