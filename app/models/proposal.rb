# Class proposals exists to store the appropriate data for proposals of business students
class Proposal < ActiveRecord::Base
	# A proposal has many reviews, but belongs to a user
	has_many :reviews
	belongs_to :user

	attr_accessible :title, :summary, :body, :score, :user_id, :created_at, :updated_at

 	# Check if proposal has reviews associated with it
 	#
 	# Parameters: Proposal ID
 	#
 	# Returns: True if there are reviews for the proposal
 	# Returns: False if there are no reviews for the proposal
	def has_reviews?(proposal_id)
		return (Review.find_all_by_proposal_id(proposal_id).count > 0)
	end

	# Get reviews associate with a proposal
	#
	# Parameters: Proposal ID
	#
	# Returns: Hash with reviews
	def get_reviews(proposal_id)
		return Review.find_all_by_proposal_id(proposal_id)
	end	
end
