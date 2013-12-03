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
