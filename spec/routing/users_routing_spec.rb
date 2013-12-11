require "spec_helper"

describe UserController do
  describe "routing" do

    it "routes to registration page" do
      get("/auth/register/cmon_let_me_in").should route_to("devise/registrations#new")
    end

    it "routes to #edit" do
      get("/auth/register/edit").should route_to("devise/registrations#edit")
    end

    it "routes to #update" do
      put("/auth/register").should route_to("devise/registrations#update")
    end

    it "routes to #destroy" do
      delete("/auth/register").should route_to("devise/registrations#destroy")
    end

  end
end
