class Proposal < ActiveRecord::Base
	has_many :review
	belongs_to :user
end