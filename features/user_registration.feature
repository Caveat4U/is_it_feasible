Feature: Allow user to register for an account with error checking

	As a user
	I want a page that I can type my information into
	Such that I can be a user and have access to the site

Scenario: Correct and acceptable account creation
  	Given I go to auth/register/cmon_let_me_in
	And I fill in the following:
	| First name | Invalid |
	| Last name | Registration |
	| Email | validregistration@colorado.edu |
	
	And I enter the password: "12345678"
	And I select "Engineering" from "Major"
	And I press "Sign up"
	Then I should see "Welcome! You have signed up successfully."

Scenario: User account already exsists
	Given the following users exist:
  	| first_name  | last_name  | email               | major               | password |
  	| FirstB      | LastB      | emailb@colorado.edu | Business            | 12345678 |
  	| FirstE      | LastE      | emaile@colorado.edu | Engineering         | 12345678 |
	
	And I go to auth/register/cmon_let_me_in
	And I fill in the following:
	| First name | FirstB |
	| Last name | LastB |
	| Email | emailb@colorado.edu |
	
	And I enter the password: "12345678"
	And I select "Engineering" from "Major"
	And I press "Sign up"
	Then I should see "Email has already been taken"

Scenario: Missing password confirmation
	Given I go to auth/register/cmon_let_me_in
	And I fill in the following:
	| First name | Invalid |
	| Last name | Registration |
	| Email | validregistration@colorado.edu |
	| Password confirmation | 12345678 |
	
	And I select "Engineering" from "Major"
	And I press "Sign up"
	Then I should see "Password can't be blank"
