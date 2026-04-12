ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "cucumber/rails"
require "factory_bot_rails"

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

World(FactoryBot::Syntax::Methods)
