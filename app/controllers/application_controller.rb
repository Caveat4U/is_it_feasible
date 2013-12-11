class ApplicationController < ActionController::Base
  protect_from_forgery

  # Method to determine if user is an engineering major
  # 
  # Returns: True if engineering student
  # Returns: False if not engineering student
  protected
  def user_is_engineering?
  	current_user.major == "Engineering"
  end
  
  # Method to determine if user is a business major
  #
  # Returns: True if business
  # Returns: False if not business
  protected
  def user_is_business?
  	current_user.major == "Business"
  end

  # Method to protect data from non-engineering users
  # Checks if user logged in and major is engineering
  # Routes back to root if either fail
  protected
  def require_user_to_be_engineering!
  	unless user_signed_in? and user_is_engineering?
  		redirect_to root_path, :alert => "Access Denied"
  	end
  end

  # Method to protect data from non-business users
  # Checks if user logged in and major is business
  # Routes back to root if either fail
  protected
  def require_user_to_be_business!
  	unless user_signed_in? and user_is_business?
  		redirect_to root_path, :alert => "Access Denied"
  	end
  end

  # Method to override devise gem default method
  # Change path redirect for post-sign-in
  #
  # Parameters: Resource (not used, just needed to override)
  def after_sign_in_path_for(resource)
    proposals_path
  end
end
