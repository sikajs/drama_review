class CreateDramas < ActiveRecord::Migration
  def change
    create_table :dramas do |t|
      t.string :title
      t.text :description
      t.integer :num_of_chapter
      t.text :actors
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
