# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Getting Started

1. Prerequisites
Ensure you have Docker and Docker Compose installed on your machine (or use WSL2/GitHub Codespaces).

2. Launch the Environment
Build the images and start the containers in detached mode:

`docker-compose up --build -d`

3. Database Setup
Once the containers are running, prepare the database schema and seed data (if any):
docker-compose exec web bin/rails db:prepare

## Testing & Code Coverage
We use RSpec for unit/model testing and Cucumber for integration/behavioral testing. SimpleCov is used to calculate the combined code coverage.

Running All Tests
To run both RSpec and Cucumber suites and generate a merged coverage report, execute:

`docker-compose exec web sh -c "bundle exec rspec && bundle exec cucumber"`

Note: We use && to ensure Cucumber only runs if RSpec passes. If you want to force both to run to see the total coverage, use ; instead of &&.

### Important Testing Rules
CUHK Email Requirement: Our models validate email formats. All test users must use an email ending in @link.cuhk.edu.hk or @cuhk.edu.hk.

Environment Sync: If you notice unexpected test failures after a git pull, try syncing the test database:

`docker-compose exec web bin/rails db:migrate RAILS_ENV=test`

Geocoding: External API calls are stubbed in spec/rails_helper.rb and features/support/env.rb to allow offline testing.