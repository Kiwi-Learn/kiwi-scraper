require 'oga'
require 'open-uri'

module KiwiScraper
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
        @document.xpath("//div[@onclick]").each do |course|
          result << course.attributes[2].value.split("'")[1]
        end
        result
      end

  end
end

