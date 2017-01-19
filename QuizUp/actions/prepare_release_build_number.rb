module Fastlane
  module Actions
    module SharedValues
      RELEASE_BUILD_NUMBER = :RELEASE_BUILD_NUMBER
    end

    class PrepareReleaseBuildNumberAction < Action
      def self.run(params)
        folder = params[:xcodeproj] ? File.join('.', params[:xcodeproj], '..') : '.'

        command_prefix = [
          'cd',
          File.expand_path(folder).shellescape,
          '&&'
        ].join(' ')

        timestamp = Time.now.utc
        new_build_identifier = "%d%02d%02d%02d%02d" % [
          timestamp.year,
          timestamp.month,
          timestamp.day,
          timestamp.hour,
          timestamp.min,
        ]
        current_version = Actions::GetVersionNumberAction.run(xcodeproj: "QuizUp.xcodeproj")

        new_version = current_version + "." + new_build_identifier

        Helper.log.info "Changed build number to #{new_version}".green

        Actions::IncrementBuildNumberAction.run(build_number: new_version)

        Actions.lane_context[SharedValues::RELEASE_BUILD_NUMBER] = new_version
      end


      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Increment the build number by adding a timestamp as the last component"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :xcodeproj,
                                       env_name: "FL_PREPARE_RELEASE_BUILD_NUMBER_PROJECT",
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
          ['RELEASE_BUILD_NUMBER', 'The new build number']
        ]
      end

      def self.authors
        ["johannth"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
