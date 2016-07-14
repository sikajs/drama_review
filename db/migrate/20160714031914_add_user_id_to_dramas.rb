class AddUserIdToDramas < ActiveRecord::Migration
  def change
    add_column :dramas, :user_id, :integer
  end
end
