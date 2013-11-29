require 'spec_helper'

describe "proposals/show" do
  before(:each) do
    @proposal = assign(:proposal, stub_model(Proposal,
      :title => "Title",
      :summary => "Summary",
      :body => "Body",
      :score => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Summary/)
    rendered.should match(/Body/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
