require 'cucumber/rails'

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :selenium_chrome
