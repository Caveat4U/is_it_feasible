class ReviewController < ApplicationController
	# Controller to manipulate the review model in the database
	
	def create
			@review = Review.create!(params[:review])
	end

	def update

	end

	# Method to remove a review from a proposal, this can be done
	# without touching the proposal itself as the relationship isn't
	# relevant in the context of removing the review
	def destroy
		@review = Review.find(params[:id])
    	@review.destroy
    	flash[:notice] = "Review deleted from the database"
    	redirect_to proposal_path(@proposal)
	end

	def view
		@review = Review.find(params[:proposal])
	end
end
