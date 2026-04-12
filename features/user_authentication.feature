Feature: User Authentication
  As a CUHK student
  I want to be able to sign up and log in
  So that I can join trading communities

  Scenario: User signs up successfully
    Given I am on the registration page
    When I fill in the registration form with valid details
    And I submit the form
    Then I should see a confirmation message

  Scenario: User logs in successfully
    Given I am a registered user
    And I am on the login page
    When I fill in my credentials
    And I submit the form
    Then I should be logged in
    And I should see my name on the page

  Scenario: User creates a community
    Given I am logged in as a verified user
    And I am on the communities page
    When I click "Create Community"
    And I fill in the community details
    And I submit the form
    Then I should see my new community listed
