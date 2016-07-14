class ChangeDramaRatingToString < ActiveRecord::Migration
  def change
    change_column :dramas, :rating, :string
  end
end
