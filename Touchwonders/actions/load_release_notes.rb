module Fastlane
  module Actions
    module SharedValues
      LOAD_BUILD_NOTES_FILE_PATH = :LOAD_BUILD_NOTES_FILE_PATH
      LOAD_RELEASE_NOTES_FILE_PATH = :LOAD_RELEASE_NOTES_FILE_PATH
      LOAD_BUILD_NOTES_TEXT = :LOAD_BUILD_NOTES_TEXT
    end

    class LoadReleaseNotesAction < Action
      def self.run(params)
        unless File.file?(params[:file_path])
          # No Release Note file found.
          # Should we ask to the user?
          if (params[:ui_prompt])
            File.open('build_notes.md', 'w') do |file|
              file.write('Write here your BUILD NOTES')
            end


            # Ask to the user to enter current RELEASE NOTE
            `"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" -w build_notes.md`
          else
            raise "No Release Note file found for path: #{params[:file_path]}".red
          end
        else
          if (params[:ui_prompt])

            # Create an empty build notes file
            File.write('build_notes.md', '')

            # Ask to the user to enter current RELEASE NOTE
            `"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" -w build_notes.md`
          end
        end


          # The automated process takes over
        File.open("./temp_release_note.md","w") do |new_file|
          new_file.puts params[:title]
          new_file.puts "\n"
          

          # Paste the current build note
          File.open('build_notes.md', "r+") do |old_file|
            old_file.each_line { |line| new_file.puts line}
          end

          # Give some space
          new_file.puts "\n"
          new_file.puts params[:separator]

          # Paste previous release notes
          File.open(params[:file_path], "r+") do |old_file|
            old_file.each_line { |line| new_file.puts line}
          end

          File.rename("./temp_release_note.md", params[:file_path]) 
        end

        release_notes_per_build = File.read(params[:file_path]).split(params[:separator])

        Actions.lane_context[SharedValues::LOAD_BUILD_NOTES_FILE_PATH] = 'build_notes.md'
        Actions.lane_context[SharedValues::LOAD_RELEASE_NOTES_FILE_PATH] = params[:file_path]
        Actions.lane_context[SharedValues::LOAD_BUILD_NOTES_TEXT] = release_notes_per_build[0].strip
      end



      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Load a release note file ready to be used'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :ui_prompt,
                                       env_name: "FL_LOAD_RELEASE_NOTES_UI_PROMPT",
                                       description: "Creates/edit a new Release Note file and opens it with Sublime app editor",
                                       optional: true,
                                       default_value: false,
                                       is_string: false),
          FastlaneCore::ConfigItem.new(key: :file_path,
                                       env_name: "FL_LOAD_RELEASE_NOTES_FILE_PATH",
                                       description: "File path to use to find the Release Note file",
                                       is_string: true,
                                       default_value: "RELEASE_NOTES.md"),
          FastlaneCore::ConfigItem.new(key: :separator,
                                       env_name: "FL_LOAD_RELEASE_NOTES_SEPARATOR",
                                       description: "Separator string used to section all release notes",
                                       is_string: true,
                                       default_value: "---"),
          FastlaneCore::ConfigItem.new(key: :title,
                                       env_name: "FL_LOAD_RELEASE_NOTES_TITLE",
                                       description: "Title used for every generated Release Note",
                                       is_string: true,
                                       default_value: Time.new.strftime("Release note - %d/%m/%Y %H:%M"))
        ]
      end

      def self.output
        [
          ['LOAD_BUILD_NOTES_FILE_PATH', 'Build notes file path'],
          ['LOAD_RELEASE_NOTES_FILE_PATH', 'Release note file path'],
          ['LOAD_BUILD_NOTES_TEXT', 'Build note text']
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