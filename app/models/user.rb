class User < ActiveRecord::Base
	has_many :review, :proposal
end