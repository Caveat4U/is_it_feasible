class ReviewController < ApplicationController
	def create
		@review = Review.create!(params[:review])

	end

	def update

	end

	def destroy
		@review = Review.find(params[:id])
    	@review.destroy
    	flash[:notice] = "Review deleted from the database"
    	redirect_to proposal_path(@proposal)
	end

	def view
		@reveiw = Review.find(params[:proposal])
		
	end
end