Feature: Allow engineering student user to write reviews for a given proposal

	As a engineering student user
	I can form a model to create reviews for proposal feedback
	So I can give great or nasty feedback to the business students

Background: Users and proposals have been added to the database and I am logged in as a engineering student.
  Given the following users exist:
  | first_name | last_name | email               | major               | password |
  | FirstB     | LastB     | emailb@colorado.edu  | Business           | 12345678 |
  | FirstE     | LastE     | emaile@colorado.edu | Engineering         | 12345678 |
  And the following proposals exist:
  | title | summary | body | user_id |
  | PTitle | This is a prop | This is a proposal in full | 1 |
  | PTitle 2 | This is a 2prop | This is a proposal2 in full | 1 |
  And I go to auth/login
  And I fill in the following:
  | Email | emaile@colorado.edu |
  | Password | 12345678 |
  And I press "Sign in"

Scenario: Valid review form
  When I am on reviews/new?proposal_id=1
  And I should see "New review"
  And I fill in the following:
  | Comment | This is a review. |
  | Rating  | 1 |
  | Plausible Language | C++ |
  | User Interested | TRUE |
  And I press "Create Review"
  Then I should see "Success"
  And I should not see "Error"

Scenario: Review only on correct page - Does the database stay persistent?
  Given I am on proposals/1
  Then I should see "This is a review."
  And I go to proposals/2
  And I should not see "This is a review."

Scenario: Cannot see edit or delete links on proposals page
  When I go to proposals
  Then I should not see "Edit"
  And I should not see "Delete"

Scenario: Cannot edit or delete proposals
  When I go to proposals/1/edit
  Then I should see "You need to sign in or sign up before continuing."


