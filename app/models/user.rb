class User < ActiveRecord::Base
	has_many :review, :proposal
	devise :database_authoenticatable, :trackable, :timeouttable, :locktable
	attr_accessible :first_name, :last_name, :major, :email, :password, :password_confirmation
end