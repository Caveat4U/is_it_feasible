require 'spec_helper'

describe Proposal do
  it "has the correct title" do
    @proposal1 = Proposal.new(:title => 'Proposal Title', :summary => 'Create a website to determine feasibility of ideas.', :body => 'My goal is to create a website that helps determine whether or not an idea is feasible. I want to ensure that business students don\'t invest a large amount of time creating a business model for an idea that simply isn\'t feasible for a programmatic standpoint.', :user_id => 1)
    @proposal1.title.should match("Proposal Title")
  end

end
