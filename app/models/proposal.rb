class Proposal < ActiveRecord::Base
	has_many :review
	belongs_to :user

	attr_accessor :proposal_text
end
