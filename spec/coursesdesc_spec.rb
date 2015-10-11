require 'minitest/autorun'
require '../lib/coursesdesc/courses.rb'
require './courses_name_test_data.rb'
require './urls_test_data.rb'

describe 'Courses desc scrap' do
  it 'should return an array include name of courses' do
    sc = KiwiScraper::ShareCourse.new
    courses_names = sc.course_name
    courses_names.must_equal COURSES_NAME_LIST
  end

  it 'should return an array include name of url' do
    sc = KiwiScraper::ShareCourse.new
    courses_urls = sc.course_url
    courses_urls.must_equal URLS_LIST
  end
end
