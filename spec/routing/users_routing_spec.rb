require "spec_helper"

describe UserController do
  describe "routing" do

    it "routes to registration page" do
      get("/auth/register/cmon_let_me_in").should route_to("devise/registrations#new")
    end

#    it "routes to #show" do
#      get("/users/1").should route_to("users#show", :id => "1")
#    end

    it "routes to #edit" do
      get("/auth/register/edit").should route_to("devise/registrations#edit", :id => "1")
    end

    it "routes to #update" do
      post("/auth/register").should route_to("devise/registrations#update")
    end

#    it "routes to #update" do
#      put("/users/1").should route_to("users#update", :id => "1")
#    end

    it "routes to #destroy" do
      delete("/auth/register").should route_to("device/registrations#destroy")
    end

  end
end
