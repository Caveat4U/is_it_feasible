module ReviewsHelper
  	def user_is_owner_of_review?(review_user_id)
  		user_signed_in? && (review_user_id == current_user.id)
  	end

  	def user_has_no_review_here(proposal_id)
      reviews.find_by_user_id_and_proposal_id(current_user.id, proposal_id) == 0
  	end
end
