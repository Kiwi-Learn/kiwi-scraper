require 'oga'
require 'open-uri'
require 'digest'
require 'pp'

module KiwiScraper
  # parse course description from sharecourse web
  class ShareCourse
    URL = 'http://www.sharecourse.net/sharecourse/course/view/courseList'

    def initialize
      parse_html
    end

    def course_name
      @course_name ||= parse_course_name
    end

    def course_date
      @course_date ||= parse_course_date
    end

    def course_url
      @course_url ||= parse_course_url
    end

    def courses_name_to_id_mapping
      @course_map ||= map_course_name_to_id
    end

    def course_id
      @course_id ||= parse_course_id
    end

    def courses_id_to_all_mapping
      @course_id_map ||= map_course_id_to_all
    end

    private

    def parse_html
      @document = Oga.parse_html(open(URL))
    end

    def parse_course_id
      course_id = []
      @document.xpath("//div[@class='gb_mid']").each do |course|
        course_id << course.children[4].children[0].children.text.split('：')[1]
      end
      course_id
    end

    def parse_course_name
      result = []
      @document.xpath("//h4[@id='courseName']").each do |course|
        result << course.text
      end
      result
    end

    def parse_course_url
      result = []
      @document.xpath('//div[@onclick]').each do |course|
        result << course.attributes[2].value.split("'")[1]
      end
      result
    end

    def parse_course_date
      # date type yyyy-mm-dd - yyyy-mm-dd
      date = []
      @document.xpath("//p[@id='courseDate']").each do |course|
        longdate = course.text
        date << longdate.split('：')[1]
      end
      date
    end

    def map_course_name_to_id
      name = parse_course_name
      course_id = parse_course_id

      hash_name = []
      name.each_index do |index|
        hash_name[index] = Digest::SHA256.digest name[index]
      end

      Hash[hash_name.zip(course_id)] # return value
    end

    def map_course_id_to_all
      name = parse_course_name
      course_id = parse_course_id
      date = parse_course_date
      url = parse_course_url
      info = {}

      # This iterate can replace by using zip function
      course_id.each_index do |index|
        info[course_id[index]] = {
          'name' => name[index],
          'date' => date[index],
          'url' => url[index],
          'id' => course_id[index]
        }
      end
      info
    end
  end
end
