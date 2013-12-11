require 'spec_helper'

describe ReviewsController do

  # This should return the minimal set of attributes required to create a valid
  # Review. As you add validations to Review, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "proposal_id" => "1", "user_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReviewsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before { controller.stub(:authenticate_user!).and_return true }



end
