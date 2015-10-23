require_relative './courses.rb'

DUMP_FILE_PATH = Dir.home + '/.kiwicourse.dump'

module KiwiScraper
  class OfflineCourses
    def initialize
      if File.exist?(DUMP_FILE_PATH)
        @sc = Marshal.load(File.read(DUMP_FILE_PATH))
      else
        @sc = KiwiScraper::ShareCourse.new
        File.open(DUMP_FILE_PATH, 'w') { |f| f.write(Marshal.dump(@sc)) }
      end
    end

    def get_instance
      @sc
    end
  end
end
