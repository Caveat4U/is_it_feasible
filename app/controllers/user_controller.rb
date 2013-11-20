class UserController < ApplicationController
	def new
		#default render new user 'login' page
	end

	def create
		@user = User.create!(params[:user])
		flash[:notice] = "User Sucessfully Created, Please Login"
		redirect_to login_path
	end
end