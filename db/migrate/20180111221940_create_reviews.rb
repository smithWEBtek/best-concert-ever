class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :concert_id
      t.text    :comment 
      t.integer :score
    end
  end
end
