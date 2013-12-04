Given(/^the following users exist:$/) do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that user to the database here.
    User.create!(user)
  end
end

Given(/^the following proposals exist:$/) do |proposals_table|
  proposals_table.hashes.each do |proposal|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Proposal.create!(proposal)
  end
end

Given(/^I log in as (a|an) (.+) student$/) do |trash, student_type|
  if student_type == "engineering"
    email = "emaile@colorado.edu"
  elsif student_type == "business"
    email = "emailb@colorado.edu"
  else
    scenario.fail!("FAIL")
  end
steps %Q{
  Given I go to auth/login
  And I fill in the following:
    | Email | #{email} |
    | Password | 12345678 |
  And I press "Sign in"
  }
end

When /I want to debug/i do
  debugger
  true
end
