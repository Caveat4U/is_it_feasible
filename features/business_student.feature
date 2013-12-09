Feature: Allow business student user to create proposals for review

	As a business student user
	I want a form to create proposal
	Such that engineering student users can view and provide feedback

Background: users have been added to database and I log in as a business student.

  Given the following users exist:
  | first_name  | last_name  | email               | major               | password |
  | FirstB      | LastB      | emailb@colorado.edu | Business            | 12345678 |
  | FirstE      | LastE      | emaile@colorado.edu | Engineering         | 12345678 |

  And I go to auth/login
  And I fill in the following:
  | Email | emailb@colorado.edu |
  | Password | 12345678 |
  And I press "Sign in"

Scenario: Correct landing page
  Then I should see "Listing proposals"

Scenario: Valid proposal form submission
  When I go to proposals/new
  And I should see "New proposal"
  And I fill in the following:
    | Title | Proposal Title |
    | Summary | This is a summary |
    | Body | This is a body for the proposals |
  And I press "Create Proposal"
  Then I should see "Proposal was successfully created"
  And I should not see "Error"


