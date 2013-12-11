module ProposalsHelper
	# Method to check if a proposal has review or not
	# 
	# Parameters: Proposal ID
	# 
	# Returns: True if review(s) exist
	# Returns: False if there are no reviews
	def has_reviews?(proposal_id)
		Review.find(proposal_id).count > 0
  	end

  	# Method to validate current user own proposal and therefore has
  	# rights to modify/delete proposal
  	#
  	# Parameters: Proposal User ID
  	#
  	# Returns: True if user owns proposal
  	# Returns: False if user doesn't own
  	def user_is_owner_of_proposal?(proposal_user_id)
  		user_signed_in? && (proposal_user_id == current_user.id)
  	end
end
