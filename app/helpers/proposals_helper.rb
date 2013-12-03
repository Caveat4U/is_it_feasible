module ProposalsHelper
	def has_reviews?
    	@reviews.count > 0
  	end

  	def user_is_owner_of_proposal?(proposal_user_id)
  		user_signed_in? && (proposal_user_id == current_user.id)
  	end

  	def get_proposals
      	if current_user.major == "Business"
        	proposals.find_by_user(current_user.id)
	    else
	        proposals
	    end
  	end
end
