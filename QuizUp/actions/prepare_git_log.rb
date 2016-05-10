module Fastlane
  module Actions
    module SharedValues
      GIT_LOG = :GIT_LOG
    end

    class PrepareGitLogAction < Action
      def self.run(params)

        command = [
          'git',
          'log',
          '--pretty=format:"%s %n"',
          '--since 3-days'
        ]

        Actions.lane_context[SharedValues::RELEASE_BUILD_NUMBER] = Actions.sh(command.join(' '))
      end

      def self.description
        "Gets the pretty git log for the last 3 days"
      end

      def self.available_options
        [
        ]
      end

      def self.output
        [
          ['GIT_LOG', 'The git log for the last 3 days']
        ]
      end

      def self.author
        "hilmarbirgir"
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end