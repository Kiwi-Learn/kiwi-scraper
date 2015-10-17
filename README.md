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

Run it from the command line. We provide 4 features to you to browse courses information on  [Sharecourse](http://sharecourse.net/sharecourse/general/home/).

- list
- search
- info
- open


Help
```sh
$ kiwicourse
Commands:
  kiwicourse help [COMMAND]     # Describe available commands or one specific command
  kiwicourse info ID            # Display information about course.
  kiwicourse list               # List all courses on ShareCourse
  kiwicourse open ID            # open the course page on browser with course id
  kiwicourse search COURSENAME  # Search a course on ShareCourse
```

List all courses on [Sharecourse](http://sharecourse.net/sharecourse/general/home/)
```sh
$ kiwicourse list
MA02004 - 會計學原理
AO35004 - 行動磨課師【曠世名琴訴說的故事】
DM91002 - 方法對了，人人都可以是設計師

...

CS01001 - 網路安全 Network Security
CS01002 - 作業系統 Operating Systems
EE62002 - 小型風力機系統與國際認證 (104 秋季班)
```

Search a course with a keyword
```sh
$ kiwicourse search 會計
MA02004 - 會計學原理
```

Open the course webpage in browser
```sh
$ kiwicourse open MA02004
```

Use it from your Ruby code:
````ruby
require 'coursesdesc'
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
