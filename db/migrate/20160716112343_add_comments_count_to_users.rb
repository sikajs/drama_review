class AddCommentsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :comments_count, :integer
  end
end