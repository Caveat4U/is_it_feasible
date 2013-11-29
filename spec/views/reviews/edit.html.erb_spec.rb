require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :proposal_id => 1,
      :user_id => 1,
      :comment => "MyString",
      :rating => 1,
      :plausible_language => "MyString",
      :user_interested => false
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", review_path(@review), "post" do
      assert_select "input#review_proposal_id[name=?]", "review[proposal_id]"
      assert_select "input#review_user_id[name=?]", "review[user_id]"
      assert_select "input#review_comment[name=?]", "review[comment]"
      assert_select "input#review_rating[name=?]", "review[rating]"
      assert_select "input#review_plausible_language[name=?]", "review[plausible_language]"
      assert_select "input#review_user_interested[name=?]", "review[user_interested]"
    end
  end
end
