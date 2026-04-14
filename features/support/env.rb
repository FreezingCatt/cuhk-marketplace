require 'simplecov'
SimpleCov.command_name 'Cucumber'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/features/'
  merge_timeout 3600
end

require 'cucumber/rails'

ActionController::Base.allow_rescue = false
DatabaseCleaner.allow_remote_database_url = true

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation