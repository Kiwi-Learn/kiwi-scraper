require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'
require './lib/kiwicourse.rb'
require './spec/courses_id_data.rb'
require './spec/courses_name_data.rb'
require './spec/courses_url_data.rb'
require './spec/courses_date_data.rb'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('courses') do
  sc = KiwiScraper::ShareCourse.new
  describe 'Courses desc scrap' do
    it 'should return an array include name of courses' do
      courses_names = sc.course_name
      courses_names.sort.must_equal COURSES_NAME_LIST.sort
    end
    it 'should return an array include url' do
      courses_urls = sc.course_url
      courses_urls.sort.must_equal COURSES_URLS_LIST.sort
    end
    it 'should return an array include date' do
      courses_dates = sc.course_date
      courses_dates.sort.must_equal COURSES_DATE_LIST.sort
    end
    it 'should return an array include courses ID' do
      course_ids = sc.course_id
      course_ids.must_equal COURSES_ID_LIST
    end
  end
end
