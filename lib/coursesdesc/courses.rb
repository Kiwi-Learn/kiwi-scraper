require 'oga'
require 'open-uri'
require 'digest'

module KiwiScraper
  # parse course description from sharecourse web
  class ShareCourse
    URL = 'http://www.sharecourse.net/sharecourse/course/view/courseList'

    def initialize
      get_html
    end

    def get_html
      @document = Oga.parse_html(open(URL))
    end

    def course_name
      @course_name ||= get_course_name
    end

    def course_url
      @course_url ||= get_course_url
    end

    def courses_name_to_url_mapping
      @course_map ||= get_course
    end

    private

    def get_course_name
      result = []
      @document.xpath("//h4[@id='courseName']").each do |course|
        result << course.text
      end
      result
    end

    def get_course_url
      result = []
      @document.xpath('//div[@onclick]').each do |course|
        result << course.attributes[2].value.split("'")[1]
      end
      result
    end

    def get_course
      name = []
      @document.xpath("//h4[@id='courseName']").each do |course|
        name << course.text
      end

      hash_name = []
      name.each_index do |index|
        hash_name[index] = Digest::SHA256.digest name[index]
      end

      url = []
      @document.xpath('//div[@onclick]').each do |course|
        url << course.attributes[2].value.split("'")[1]
      end

      result = Hash[hash_name.zip(url)]

      result
    end
  end
end
