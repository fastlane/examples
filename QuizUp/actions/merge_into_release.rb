module Fastlane
  module Actions
    class MergeIntoReleaseAction < Action
      def self.run(params)

        command = [
          "git",
          "merge",
          "origin/master",
        ].join(' ')

        Actions.sh command
        
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Merge the latest master into release before submitting."
      end

      def self.authors
        ["hilmarbirgir", "alliannas"]
      end

      def self.is_supported?(platform)
        true
      end

    end
  end
end

