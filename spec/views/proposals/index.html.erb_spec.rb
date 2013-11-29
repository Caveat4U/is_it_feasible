require 'spec_helper'

describe "proposals/index" do
  before(:each) do
    assign(:proposals, [
      stub_model(Proposal,
        :title => "Title",
        :summary => "Summary",
        :body => "Body",
        :score => 1,
        :user_id => 2
      ),
      stub_model(Proposal,
        :title => "Title",
        :summary => "Summary",
        :body => "Body",
        :score => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of proposals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Summary".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
