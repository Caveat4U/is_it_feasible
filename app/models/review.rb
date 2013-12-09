# Class review exists to store the appropriate data for reviews of proposals
class Review < ActiveRecord::Base
	# A review belongs to a single user
	belongs_to :user

	# Setup accessible (or protected) attributes for model user
	attr_accessible :proposal_id, :user_id, :comment, :rating, :plausible_language, :user_interested, :created_at, :updated_at
end
