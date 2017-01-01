module Fastlane
  module Actions
    class UploadToS3Action < Action
      def self.run(options)

        s3 = Aws::S3::Resource.new
        file_path = options[:ipa]
        obj = s3.bucket(options[:project_bucket-name]).object(File.basename(file_path))
        obj.upload_file(file_path, acl:'public-read')
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Uploads a build to s3"
      end

      def self.authors
        ["hilmarbirgir"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: ipa,
                                      env_name: "S3_IPA_FILE_PATH",
                                      description: "Path to the IPA file to upload",
                                      default_value: Actions.lane_context[SharedValues::IPA_OUTPUT_PATH],
                                      optional: true,
                                      verify_block: proc do |value|
                                         UI.user_error!("Couldn't find ipa file at path '#{value}'") unless File.exist?(value)
                                      end),
          FastlaneCore::ConfigItem.new(key: project_bucket_name,
                                       env_name: "S3_PROJECT_BUCKET_NAME",
                                       description: "S3 project bucket name",
                                       type: String,
                                       optional: false)
        ]
      end

      def self.is_supported?(platform)
        platform == :ios
      end

    end
  end
end

