class Proposal < ActiveRecord::Base
	has_many :reviews
	belongs_to :user

	attr_accessible :title, :summary, :body, :score, :user_id, :created_at, :updated_at

  def has_reviews?(proposal_id)
    return (Review.find_all_by_proposal_id(proposal_id).count > 0)
  end

  def get_reviews(proposal_id)
  	return Review.find_all_by_proposal_id(proposal_id)
  end	
end
