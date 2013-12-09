class ReviewsController < ApplicationController
  # Requires any method call to be made by an engineering user if called directly
  before_filter :require_user_to_be_engineering!

  # Method to get list of reviews
  # Index of reviews only return for engineering students
  # Reviews returned are only those written by the engineering student user
  def index
    if user_signed_in? and ( current_user.major == "Engineering" )
      @reviews = Review.find_all_by_user_id(current_user.id)
    else
      redirect_to root_path, :alert => "Access Denied"
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # Method to show individual review
  # No protection on this method, when not paired to a proposal
  # Review has no meaning
  # Parameters: review id
  # Returns: single review
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # Method to get a hash of reviews by the proposal id
  # Paremeters: proposal id
  # Returns: hash of reviews
  def get_reviews
    @review = Review.find(params[:proposal_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # Method to create new review
  # Renders form by default
  def new
    @review = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # Method to call edit on review
  # Renders form
  # Validates calling user owns review
  def edit
    @review = Review.find(params[:id])
    
    if current_user.id == @review.user_id
      @review
    else
      redirect_to root_path, :alert => "Access Denied"
    end
  end

  # Method to create new revies
  # Renders form
  def create
    @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # Method to call update on review
  # Renders form
  # Validates calling user owns review
  def update
    @review = Review.find(params[:id])

    if current_user.id == @review.user_id
      respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end

    else
      redirect_to root_path, :alert => "Access Denied"
    end 
  end

  # Method to delete review
  # Validates user is owner of review
  # If validation fails, redirects to root
  def destroy
    @review = Review.find(params[:id])

    if current_user.id == @review.user_id
      @review.destroy

      respond_to do |format|
        format.html { redirect_to reviews_url }
        format.json { head :ok }
      end
    else
      redirect_to root_path, :alert => "Access Denied"
    end  
  end
end
