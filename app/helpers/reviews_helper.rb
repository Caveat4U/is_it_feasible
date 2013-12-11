module ReviewsHelper
    # Method to validate user is owner of review and therefore has
    # permissions to modify/delete
    #
    # Parameters: Proposal ID
    # 
    # Returns: True if review(s) exist
    # Returns: False if there are no reviews
  	def user_is_owner_of_review?(review_user_id)
  		user_signed_in? && (review_user_id == current_user.id)
  	end

  	# Function searches to determine if user has already written a review
  	# for the current proposal
  	#
  	# Parameters: Proposal ID
  	#
  	# Returns 'false' if user has already written a review
  	# Returns 'true' if user hasn't written a review yet
  	def user_has_no_review_here(proposal_id)
  		has_review = true
     	Review.find_all_by_proposal_id(proposal_id).each do |review|
     		if review.user_id == current_user.id
     			has_review = false
     		end
     	end
     	has_review
  	end
end
