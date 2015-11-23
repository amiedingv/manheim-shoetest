# Tests for Shoes Store

Author: Amie Ding

# Setup
1. install ruby, git on your computer
2. install Firefox, Chrome in your computer
3. copy chromedriver from here http://chromedriver.storage.googleapis.com/index.html?path=2.20/ and unzip it
4. add chromedriver file into the system PATH
4. clone this repository into a folder by: git clone 
5. cd to the folder, and install the bundler gem:
    $ gem install bundler
6. install all of the required gems defined in the gemfile:
    $ bundle install
7. Run cucumber through bundler, default is using Chrome as browser:

    $ bundle exec cucumber

# Notes
1. This project uses Watir Webdriver to test web UI; it will start a real browser to visit the web and use cucumber to test.
2. Support Firefox, Chrome, IE
3. Additional tests should also consider: performance testing, REST API testing; etc.

# Contributing

