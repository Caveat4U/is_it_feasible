Feature: Provide user a way to login and error check

	As a user
	I want a page to login that will verify my information
	Such that my data is secure and I can access it

Background: Users have been created
  Given the following users exist:
  | first_name  | last_name  | email               | major               | password |
  | FirstB      | LastB      | emailb@colorado.edu | Business            | 12345678 |
  | FirstE      | LastE      | emaile@colorado.edu | Engineering         | 12345678 |

Scenario: Invalid Login
  And I go to auth/login
  And I fill in the following:
  | Email | invalidlogin@colorado.edu |
  | Password | 12345678 |

  And I press "Sign in"
  Then I should see "Invalid email or password."

Scenario: Valid Login
  And I go to auth/login
  And I fill in the following:
  | Email | emailb@colorado.edu |
  | Password | 12345678 |

  And I press "Sign in"
  Then I should see "Listing proposals"