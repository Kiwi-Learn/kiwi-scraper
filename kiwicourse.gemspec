$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'coursesdesc/version'
Gem::Specification.new do |s|
  s.name = 'kiwicourse'
  s.version = CoursesDesc::VERSION
  s.date = CoursesDesc::DATE
  s.executables << 'kiwicourse'
  s.summary = 'Course outline of Sharecourese'
  s.description = 'Get course name and url list from Sharecourese of NTHU.'
  s.authors = ['John Lin', 'Robert Chang', 'Vicky Lee', 'Sam Cheng']
  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files spec/*`.split("\n")
  s.homepage    =  'https://github.com/Kiwi-Learn/kiwi-scraper'
  s.license     =  'MIT'

  # depend gem
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_runtime_dependency 'oga'
  s.add_runtime_dependency 'thor'
  s.add_runtime_dependency 'fuzzy_match'
  s.add_runtime_dependency 'launchy'
end
