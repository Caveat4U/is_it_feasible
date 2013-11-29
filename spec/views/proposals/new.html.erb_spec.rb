require 'spec_helper'

describe "proposals/new" do
  before(:each) do
    assign(:proposal, stub_model(Proposal,
      :title => "MyString",
      :summary => "MyString",
      :body => "MyString",
      :score => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new proposal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", proposals_path, "post" do
      assert_select "input#proposal_title[name=?]", "proposal[title]"
      assert_select "input#proposal_summary[name=?]", "proposal[summary]"
      assert_select "input#proposal_body[name=?]", "proposal[body]"
      assert_select "input#proposal_score[name=?]", "proposal[score]"
      assert_select "input#proposal_user_id[name=?]", "proposal[user_id]"
    end
  end
end
