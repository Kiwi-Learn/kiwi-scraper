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
```sh
$ coursesdesc
```

Screenshots

```sh
    _________        _______   ____
   / __/ ___/ ____  / ___/ /  /  _/
  _\ \/ /__  /___/ / /__/ /___/ /  
 /___/\___/        \___/____/___/  

> courses
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

## Test

```sh
$ cd spec
$ ruby coursesdesc_spec.rb
```
