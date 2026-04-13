source "https://rubygems.org"

ruby "3.4.7"

gem "rails", "~> 7.1.0"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "redis", ">= 4.0.1"

gem "bootsnap", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "devise", "~> 4.9"

gem "pundit", "~> 2.3"

gem "ransack", "~> 4.0"

gem "sidekiq", "~> 7.2"

gem "kaminari", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails", "~> 7.0"
  gem "factory_bot_rails", "~> 6.4"
  gem "faker", "~> 3.2"
  gem "cucumber-rails", require: false
  gem "database_cleaner", "~> 1.8"
  gem "shoulda-matchers", "~> 6.0"
  gem "simplecov", require: false
  gem "capybara"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem 'simplecov', require: false
end