require 'spec_helper'

describe ProposalsController do

  # This should return the minimal set of attributes required to create a valid
  # Proposal. As you add validations to Proposal, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProposalsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before { controller.stub(:authenticate_user!).and_return true }

  
  describe "GET edit" do
    it "assigns the requested proposal as @proposal" do
      proposal = Proposal.create! valid_attributes
      get :edit, {:id => proposal.to_param}, valid_session
      assigns(:proposal).should eq(proposal)
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested proposal as @proposal" do
        proposal = Proposal.create! valid_attributes
        put :update, {:id => proposal.to_param, :proposal => valid_attributes}, valid_session
        assigns(:proposal).should eq(proposal)
      end
    end

    describe "with invalid params" do
      it "assigns the proposal as @proposal" do
        proposal = Proposal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Proposal.any_instance.stub(:save).and_return(false)
        put :update, {:id => proposal.to_param, :proposal => { "title" => "invalid value" }}, valid_session
        assigns(:proposal).should eq(proposal)
      end
    end
  end


end
