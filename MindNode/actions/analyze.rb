module Fastlane
  module Actions
    module SharedValues
      
    end

    class AnalyzeAction < Action
      def self.run(params)
        tools_path = ENV["ANALYZE_TOOLS_PATH"] || File.expand_path("~/analyze_tools")

        unless File.exists?tools_path
          Helper.log.fatal "Please download 'http://clang-analyzer.llvm.org/downloads/checker-276.tar.bz2' and store in ~/analyze_tools".red
          Helper.log.fatal "You can also store it anywhere else and provide the path using the environment variable ANALYZE_TOOLS_PATH".red
          raise "Couldn't find clang tools. Please download them from the above logged link."
        end

        params = [
          "-workspace", "'MindNode-iOS.xcworkspace'",
          "-scheme", "'MindNode for iOS'",
          "-configuration", "Debug",
          "-sdk", "iphonesimulator",
          "-arch", "i386"
        ].join(" ")

        begin
          output = Actions.sh(File.join(tools_path, "scan-build") + " xcodebuild #{params} clean analyze")
          path = output.match(/scan-view (.*)\'/)[1]
          resulting_path = './fastlane/analyze_report/'
          FileUtils.rm_rf(resulting_path) rescue nil
          FileUtils.cp_r(path, resulting_path)

          Helper.log.info "Successfully generated analyzer report at path #{File.expand_path(resulting_path)}".green
        rescue => ex
          Helper.log.fatal ex
          raise "Static Analyzer failed!".red
        end
      end
    end
  end
end