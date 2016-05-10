module Fastlane
  module Actions
    class UploadToS3Action < Action
      def self.run(params)

        s3 = Aws::S3::Resource.new
        file_path = File.expand_path(File.dirname(__FILE__) + "/../../QuizUp.ipa")
        obj = s3.bucket(ENV['SECRET-PROJECT-BUCKET-NAME']).object('QuizUp.ipa')
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

      def self.is_supported?(platform)
        platform == :ios
      end

    end
  end
end

