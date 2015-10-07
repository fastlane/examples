module Fastlane
  module Actions
    module SharedValues
      GET_GLOBAL_VALUE_CUSTOM_VALUE = :GET_GLOBAL_VALUE_CUSTOM_VALUE
    end

    class GetGlobalValueAction < Action
      def self.run(params)
        key = params[:key]
        Actions.lane_context[SharedValues::GET_GLOBAL_VALUE_CUSTOM_VALUE] = self.projectKey(key)
      end



      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
      end

      def self.available_options
        # Define all options your action supports. 
        # The environment variable (last parameters) is optional, remove it if you don't need it
        # You can add as many parameters as you want
        [
          ['key', 'The key for which to find a value'],
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['GET_GLOBAL_VALUE_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.author
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        'duemunk'
      end
      
      def self.is_supported?
        true
      end
      
      def self.projectKey(aKey)
        projectKey = ''
        filename = "./BeMyEyes/Source/BMEGlobal.h"
        File.open(filename, "r:UTF-8") do |f|
          contents = f.read
          contents.scan(/\#define\s([^\s]*)\s@\"([^\"]*)\"/) do |key, value|
            if key == aKey
              projectKey = value
            end
          end
        end
        return projectKey
      end
    end
  end
end
