Feature: Allow business student user to create proposals for review

	As a business student user
	I want a form to create proposal
	Such that engineering student users can view and provide feedback

Background: users have been added to database and I log in as a business student.

  Given the following users exist:
  | first_name  | last_name  | email               | major               | password |
  | FirstB      | LastB      | emailb@colorado.edu  | Business            | $2a$10$8UOo0aNXJFYPSVBsRz.yluVKAZy4SUfPALxoE4.urDF0LkHx3pAEu |
  | FirstE      | LastE      | emaile@colorado.edu | Engineering         | $2a$10$8UOo0aNXJFYPSVBsRz.yluVKAZy4SUfPALxoE4.urDF0LkHx3pAEu |
  And I go to auth/login
  And I fill in the following:
    | Email | emailb@colorado.edu |
    | Password | 12345678 |
  And I press "Sign in"
  And I go to proposals/new

Scenario: Valid form submission
  When I fill in the following:
    | Title | Proposal Title |
    | Summary | This is a summary |
    | Body | This is a body for the proposals |
  And I press "Create Proposal"
  Then I should see "Success"
  And I should not see "Error"

