class ApplicationController < ActionController::Base
  protect_from_forgery

  #
  protected
  def user_is_engineering?
  	current_user.major == "Engineering"
  end
  
  #
  protected
  def user_is_business?
  	current_user.major == "Business"
  end

  #
  protected
  def require_user_to_be_engineering!
  	unless user_signed_in? and user_is_engineering?
  		redirect_to root_path, :alert => "Access Denied"
  	end
  end

  #
  protected
  def require_user_to_be_business!
  	unless user_signed_in? and user_is_business?
  		redirect_to root_path, :alert => "Access Denied"
  	end
  end
end
