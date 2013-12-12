require 'spec_helper'

describe Review do
  it "has the correct comment" do
    @review1 = Review.new(:proposal_id => 1, :user_id => 1, :comment => 'This is a great idea!', :rating => 5, :plausible_language => 'PHP', :user_interested => TRUE)
    @review1.comment.should match("This is a great idea!")
  end
end
