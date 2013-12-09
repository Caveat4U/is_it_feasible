# Add users to test database from hash
Given(/^the following users exist:$/) do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that user to the database here.
    User.create!(user)
  end
end

# Add proposals to test database from hash
Given(/^the following proposals exist:$/) do |proposals_table|
  proposals_table.hashes.each do |proposal|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Proposal.create!(proposal)
  end
end

# Needed to match correct password field since this version of capybara
# doesn't have the exact match feature.
And (/^I enter the password: "(.*?)"$/) do |value|
  page.first(:field, "Password").set(value)
  page.first(:field, "Password confirmation").set(value)
end