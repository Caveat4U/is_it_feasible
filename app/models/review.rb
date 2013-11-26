class Review < ActiveRecord::Base
	belongs_to :user

	attr_accessor :review_text, :review_rating
end
