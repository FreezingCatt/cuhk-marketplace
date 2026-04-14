Feature: Basic Navigation
  As a visitor
  I want to see the landing page
  So that I know the marketplace is running

  Scenario: Viewing the home page
    Given I am on the home page
    Then I should see "CUHK"

  Scenario: Viewing the books list
    Given I am on the books page
    Then I should see "Books"