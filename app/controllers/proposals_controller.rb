class ProposalsController < ApplicationController
  before_filter :authenticate_user!

  # GET /proposals
  # GET /proposals.json
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

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    @proposal = Proposal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proposal }
    end
  end

  # GET /proposals/new
  # GET /proposals/new.json
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

  # GET /proposals/1/edit
  def edit
    @proposal = Proposal.find(params[:id])
    if user_signed_in? and ( current_user.major == "Business" ) and ( @proposal.user_id == current_user.id )
      @proposal
    else
      redirect_to root_path, :alert => "Access Denied"
    end
  end

  # POST /proposals
  # POST /proposals.json
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

  # PUT /proposals/1
  # PUT /proposals/1.json
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

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to proposals_url }
      format.json { head :ok }
    end
  end
end
