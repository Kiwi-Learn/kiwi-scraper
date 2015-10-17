# kiwi-scraper

[![Build Status](https://travis-ci.org/Kiwi-Learn/kiwi-scraper.svg?branch=master)](https://travis-ci.org/Kiwi-Learn/kiwi-scraper)
[![Gem Version](https://badge.fury.io/rb/kiwicourse.svg)](https://badge.fury.io/rb/kiwicourse)

Kiwi Scraper is a great tool to get [Sharecourse](http://sharecourse.net/sharecourse/general/home/) description!

We respect Sharecourse's `robots.txt`

## Usage

Install it with the following command:
```sh
$ gem install kiwicourse
```

Run it from the command line.

Search a course with a keyword
```sh
$ kiwicourse search cellular
2015 細胞神經科學Cellular Neuroscience
```

Open the course url in browser
```sh
$ kiwicourse open 科學計算
```


Use it from your Ruby code:
````ruby
require 'kiwicourse'
sc = KiwiScraper::ShareCourse.new

course_found = sc.course_name
puts course_found

url_found = sc.course_url
puts url_found

````

## Run the tests

Using [rake](http://docs.seattlerb.org/rake/) to run tests. If you don't have rake using `gem install rake` to install it.

```sh
$ rake spec
```
