class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

    	#Create text field for proposal
      	t.string :review_text,      	:null => false
      	t.string :reviewed_by,			:null => false
      	t.integer :review_rating,			:null => false

      	## Rememberable
      	t.datetime :created_at_datetime
    end
  end
end
