Feature: Rate a Book
  As a student
  I want to give a score to a book
  So that others know if it's good

  Background:
    Given the following books exist:
      | title     | price | user_email      |
      | Algorithm | 50    | seller@cuhk.edu.hk |

  Scenario: Successfully rating a book
    Given I am logged in as "buyer@cuhk.edu.hk"
    And I am on the details page for "Algorithm"

    And I fill in "Score (1-10)" with "5"
    And I fill in "Comment (optional)" with "Great book!"
    When I press "Submit Rating"

    Then I should see "5/10"
    And I should see "Great book!"