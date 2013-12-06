Feature: Allow business student user to create proposals for review

	As a anon user
	I want to see access denied messages on important pages
	Such that pages are protected

Scenario: Proposals are access protected.
  When I go to proposals/new
  Then I should see "You need to sign in or sign up before continuing."

Scenario: Reviews are access protected.
  When I go to reviews/new?proposal_id=1
  Then I should see "You need to sign in or sign up before continuing."
