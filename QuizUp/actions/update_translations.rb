module Fastlane
  module Actions
    class UpdateTranslationsAction < Action
      def self.run(params)

        command = [
          "uhura pull --yes"
        ].join(' ')
        
        Actions.sh command
        
        begin
          Actions.sh("git add -u")
          Actions.sh("git commit -m 'Updated translations'")
          rescue
            # In case there are no new translations.
          end
          
        end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Download the latest translations using uhura"
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

