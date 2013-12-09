require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :reset_password_token => "Reset Password Token",
        :sign_in_count => 1,
        :current_sign_in_ip => "Current Sign In Ip",
        :last_sign_in_ip => "Last Sign In Ip",
        :first_name => "First Name",
        :last_name => "Last Name",
        :major => "Major"
      ),
      stub_model(User,
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :reset_password_token => "Reset Password Token",
        :sign_in_count => 1,
        :current_sign_in_ip => "Current Sign In Ip",
        :last_sign_in_ip => "Last Sign In Ip",
        :first_name => "First Name",
        :last_name => "Last Name",
        :major => "Major"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Reset Password Token".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Current Sign In Ip".to_s, :count => 2
    assert_select "tr>td", :text => "Last Sign In Ip".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Major".to_s, :count => 2
  end
end
