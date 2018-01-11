class CreateConcerts < ActiveRecord::Migration[5.1]
  def change
    create_table :concerts do |t|
      t.string :name
      t.string :artist
      t.string :venue

      t.timestamps
    end
  end
end
