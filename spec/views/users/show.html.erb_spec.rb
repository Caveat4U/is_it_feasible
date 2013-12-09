require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :encrypted_password => "Encrypted Password",
      :reset_password_token => "Reset Password Token",
      :sign_in_count => 1,
      :current_sign_in_ip => "Current Sign In Ip",
      :last_sign_in_ip => "Last Sign In Ip",
      :first_name => "First Name",
      :last_name => "Last Name",
      :major => "Major"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Encrypted Password/)
    rendered.should match(/Reset Password Token/)
    rendered.should match(/1/)
    rendered.should match(/Current Sign In Ip/)
    rendered.should match(/Last Sign In Ip/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Major/)
  end
end
