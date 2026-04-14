require 'simplecov'

SimpleCov.command_name 'RSpec'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/features/'
  merge_timeout 3600 
end

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'geocoder'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.fixture_paths = [Rails.root.join('spec/fixtures')]
  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!
  config.include Devise::Test::IntegrationHelpers, type: :request

  Geocoder.configure(lookup: :test, ip_lookup: :test)
  
  Geocoder::Lookup::Test.add_stub(
    "United College", [
      {
        'latitude'     => 22.4178,
        'longitude'    => 114.2075,
        'address'      => 'United College, CUHK',
        'state'        => 'Hong Kong',
        'country'      => 'China',
        'country_code' => 'HK'
      }
    ]
  )
  
  Geocoder::Lookup::Test.add_stub(
    "Shaw College", [
      { 'latitude' => 22.4205, 'longitude' => 114.2079 }
    ]
  )
end