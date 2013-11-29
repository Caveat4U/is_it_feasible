class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :proposal_id
      t.integer :user_id
      t.string :comment
      t.integer :rating
      t.string :plausible_language
      t.boolean :user_interested

      t.timestamps
    end
  end
end
