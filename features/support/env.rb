require 'watir-webdriver'
require 'pry'

if ENV['BROWSER'].nil?
  ENV['BROWSER'] = 'chrome'
end
CONFIG = YAML.load_file('config/cucumber.yml')
CONFIG.merge!(YAML.load_file('config/settings.yml'))

Before do |scenario|
  unless @browser && @browser.class == Watir::Browser
    @browser = Watir::Browser.new ENV['BROWSER']
  end
  @shoes_home = CONFIG[CONFIG['default_env']]['home'] || "http://shoestore-manheim.rhcloud.com/"
end

After do |scenario|
  if @browser && @browser.class == Watir::Browser
    @browser.close
  end
end

