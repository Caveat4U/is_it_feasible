class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|

    	#Add time stamp
      	t.timestamps

      	#Create text field for proposal
      	t.string :proposal_text,      	:null => false
      	t.string :created_by,			:null => false

      	## Rememberable
      	t.datetime :created_at_datetime
    end
  end
end
