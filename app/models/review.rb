class Review < ActiveRecord::Base
	attr_accessible :proposal_id, :user_id, :comment, :rating, :plausible_language, :user_interested, :created_at, :updated_at
end
