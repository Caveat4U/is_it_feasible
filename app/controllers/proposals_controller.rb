class ProposalsController < ApplicationController
  # Verify a user is logged in before granting them access to view proposals
  before_filter :authenticate_user!

  # Method to show all proposals in the view
  # If user is business only show the proposals owned by the user
  # If user is engineering shows all proposals
  def index
    if current_user.major == "Business"
      @proposals = Proposal.find_all_by_user_id(current_user.id)
    else
      @proposals = Proposal.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proposals }
    end
  end

  # Method to show specifci proposal
  #
  # If user is business user, redirect to root if they don't own it
  # If engineering user, just renders page
  # If proposal doesn't exist, then redirect to root
  def show
    @proposal = Proposal.find(params[:id])

    if current_user.major == "Business" and @proposal.user_id != current_user.id
      redirect_to root_path, :alert => "Access Denied"
    end

    if @proposal == nil
      redirect_to root_path, :alert => "No such proposal"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal }
    end
  end

  # Method to create new proposal
  # Validates user signed in and business user
  #
  # If validation fails, redirects to root
  def new
    if user_signed_in? and ( current_user.major == "Business" )
      @proposal = Proposal.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @proposal }
      end
    else
      redirect_to root_path, :alert => "Access Denied"
    end
  end

  # Method to render edit form for a specfic proposal
  #
  # Parameters: proposal id
  #
  # Validates user is logged in and the proposal belongs to the user
  # If validation fails, redirects to root
  def edit
    @proposal = Proposal.find(params[:id])
    if user_signed_in? and ( current_user.major == "Business" ) and ( @proposal.user_id == current_user.id )
      @proposal
    else
      redirect_to root_path, :alert => "Access Denied"
    end
  end

  # Method to create new proposal
  #
  # Validates user signed in and business user
  # If validation fails, redirects to root
  def create
    if user_signed_in? and ( current_user.major == "Business" )
      @proposal = Proposal.create!(params[:proposal])

      respond_to do |format|
        if @proposal.save
          format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
          format.json { render json: @proposal, status: :created, location: @proposal }
        else
          format.html { render action: "new" }
          format.json { render json: @proposal.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, :alert => "Access Denied"
    end
  end

  # Method to render update form for a specfic proposal
  #
  # Parameters: Proposal ID
  #
  # Validates user is logged in and the proposal belongs to the user
  # If validation fails, redirects to root
  def update
    @proposal = Proposal.find(params[:id])

    if user_signed_in? and ( current_user.major == "Business" ) and ( @proposal.user_id == current_user.id )
      respond_to do |format|
        if @proposal.update_attributes(params[:proposal])
          format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @proposal.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, :alert => "Access Denied"
    end  
  end

  # Method to delete proposal
  # 
  # Parameters: Proposal ID
  #
  # Verifies user is logged in and owns proposal
  # If verification fails, redirects to root
  def destroy
    @proposal = Proposal.find(params[:id])
    if user_signed_in? and ( current_user.major == "Business" ) and ( @proposal.user_id == current_user.id )
      @proposal.destroy
    else
      redirect_to root_path, :alert => "Access Denied"
    end

    respond_to do |format|
      format.html { redirect_to proposals_url }
      format.json { head :ok }
    end
  end
end
