require 'spec_helper'

describe User do
  it "has the corrent major" do
    @euser = User.new(:email => 'e@gmail.com', :password => 'password', :password_confirmation => 'password', :first_name => 'First', :last_name => 'Last', :major => 'Engineering')
    @euser.major.should match("Engineering")
  end
end
