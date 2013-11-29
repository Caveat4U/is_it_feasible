class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :summary
      t.string :body
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
