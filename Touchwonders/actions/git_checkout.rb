module Fastlane
  module Actions
    module SharedValues
      GIT_CHECKOUT_BRANCH = :GIT_CHECKOUT_BRANCH
    end

    class GitCheckoutAction < Action
      def self.run(params)
        remote_branch = params[:remote_branch]

        # construct our command as an array of components
        command = [
          'git',
          'checkout',
          remote_branch
        ]

        # execute our command
        Actions.sh('pwd')

        Actions.sh(command.join(' '))
        Helper.log.info "Successfully checkout branch #{remote_branch}."
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Checkout a branch from project working copy'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :remote_branch,
                                       env_name: "FL_GIT_CHECKOUT_BRANCH",
                                       description: "The branch name that needs to be checkout",
                                       is_string: true,
                                       default_value: "master")
        ]
      end

      def self.output
        [
          ['GIT_CHECKOUT_BRANCH', 'The branch name that needs to be checkout']
        ]
      end

      def self.authors
        ["fabiomilano"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end