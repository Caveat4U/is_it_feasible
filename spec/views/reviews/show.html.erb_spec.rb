require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :proposal_id => 1,
      :user_id => 2,
      :comment => "Comment",
      :rating => 3,
      :plausible_language => "Plausible Language",
      :user_interested => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Comment/)
    rendered.should match(/3/)
    rendered.should match(/Plausible Language/)
    rendered.should match(/false/)
  end
end
