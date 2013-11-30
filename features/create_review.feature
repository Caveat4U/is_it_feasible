Feature: Allow engineering student user to write reviews for a given proposal

	As a engineering student user
	I can form a model to create reviews for proposal feedback
	So I can give great or nasty feedback to the business students

Background:
  Given the following users exist:
  | first_name | last_name | email               | major               |
  | FirstB     | LastB     | email@colorado.edu  | Business Student    |
  | FirstE     | LastE     | email2@colorado.edu | Engineering Student |
  And the following proposals exist:
  | title | summary | body | score | user_id |
  | PTitle | This is a prop | This is a proposal in full | 0 | 0 |
  | PTitle 2 | This is a 2prop | This is a proposal2 in full | 0 | 0 |

Scenario: Valid review form
  Given I am on "proposals/1"
  When I fill in the following:
  | user_id | 0 |
  | comment | This is a review. |
  | rating  | 1 |
  | plausible_language | C++ |
  | user_interested | TRUE |
  And I press "Create Review"
  Then I should see "Success"
  And I should not see "Error"

Scenario: Review only on correct page - Does the database stay persistent?
  Given I am on "proposals/1"
  Then I should see "This is a review."
  And I go to "proposals/2"
  And I should not see "This is a review."
