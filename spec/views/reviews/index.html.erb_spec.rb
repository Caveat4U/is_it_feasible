require 'spec_helper'

describe "reviews/index" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :proposal_id => 1,
        :user_id => 2,
        :comment => "Comment",
        :rating => 3,
        :plausible_language => "Plausible Language",
        :user_interested => false
      ),
      stub_model(Review,
        :proposal_id => 1,
        :user_id => 2,
        :comment => "Comment",
        :rating => 3,
        :plausible_language => "Plausible Language",
        :user_interested => false
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Plausible Language".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
