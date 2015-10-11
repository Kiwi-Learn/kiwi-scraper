# kiwi-scraper

Kiwi Scraper is a great tool to get [Sharecourse](http://sharecourse.net/sharecourse/general/home/) description!

We respect Sharecourse's `robots.txt`

## Usage

Install it with the following command:
```sh
$ bundle install
```

Run it from the command line.
```sh
$ ./bin/coursesdesc
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
require './lib/coursesdesc/courses.rb'
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
