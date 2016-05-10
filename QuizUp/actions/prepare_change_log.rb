module Fastlane
  module Actions
    class PrepareChangeLogAction < Action
      def self.run(params)
        locales = ["de-DE", "en-US", "es-ES", "es-MX", "fr-FR", "pt-BR"]
        localesWithMissingChangeLog = []

        locales.each do |locale|
            remainingChangeLogsForLocale = self.check_line_count_for_change_log_file(locale)
            if remainingChangeLogsForLocale == 0
                localesWithMissingChangeLog.push(locale)
            end
        end

        if localesWithMissingChangeLog.empty? == false
            missingChangeLogString = localesWithMissingChangeLog.join(', ')        
            raise "Ran out of localized change logs in %s" % missingChangeLogString
        end

        locales.each do |locale|
            newChangeLog = self.get_change_log_from_file(locale)
            self.set_new_change_log(locale, newChangeLog)
            self.remove_change_log_from_file(locale)
        end
        
        begin
          Actions.sh("git add -u")
          Actions.sh("git commit -m 'Updated changelogs.'")
          rescue
            # In case there are no changes.
            puts("No changes to localized changelogs")
          end

      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.check_line_count_for_change_log_file(locale)
        file_path = self.change_log_file_path(locale) 
        line_count = `grep -c '^' "#{file_path}"`.strip.split(' ')[0].to_i
        return line_count
      end

      def self.get_change_log_from_file(locale)
        file_path = self.change_log_file_path(locale)
        change_log = File.open(file_path, &:readline)
        return change_log
      end
      
      def self.remove_change_log_from_file(locale)
        file_path = self.change_log_file_path(locale)
        text = ''
        File.open(file_path,"r"){|f|f.gets;text=f.read}
        File.open(file_path,"w+"){|f| f.write(text)}
      end
      
      def self.set_new_change_log(locale, change_log)
        file_path = File.expand_path(File.dirname(__FILE__) + "/../metadata/" + locale + "/release_notes.txt")
        File.open(file_path, 'w') { |file| file.write(change_log) }
        puts("New change log in %s:" % locale)
        puts(change_log)
      end
      
      def self.change_log_file_path(locale)
        file_path = File.expand_path(File.dirname(__FILE__) + "/../changelogs/" + locale + ".txt")
        return file_path
      end
      
      def self.description
        "Set the change log"
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

