require 'spec_helper'

describe "proposals/edit" do
  before(:each) do
    @proposal = assign(:proposal, stub_model(Proposal,
      :title => "MyString",
      :summary => "MyString",
      :body => "MyString",
      :score => 1,
      :user_id => 1
    ))
  end

  it "renders the edit proposal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", proposal_path(@proposal), "post" do
      assert_select "input#proposal_title[name=?]", "proposal[title]"
      assert_select "input#proposal_summary[name=?]", "proposal[summary]"
      assert_select "input#proposal_body[name=?]", "proposal[body]"
      assert_select "input#proposal_score[name=?]", "proposal[score]"
      assert_select "input#proposal_user_id[name=?]", "proposal[user_id]"
    end
  end
end
