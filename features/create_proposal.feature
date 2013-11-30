Feature: Allow business student user to create proposals for review

	As a business student user
	I want a form to create proposal
	Such that engineering student users can view and provide feedback

Background: users have been added to database

  Given the following users exist:
  | first_name  | last_name  | email               | major               |
  | FirstB      | LastB      | email@colorado.edu  | Business Student    |
  | FirstE      | LastE      | email2@colorado.edu | Engineering Student |
  And I am on "proposals/new" 

Scenario: Valid form submission
  Given I fill in the following:
    | title | Proposal Title |
    | summary | This is a summary |
    | body | This is a body for the proposals |
    | score | 0 |
    | user_id | 0 |
  When I press "Create Proposal"
  Then I should see "Success"
  And I should not see "Error"

