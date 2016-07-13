class AddAttachmentImageToDramas < ActiveRecord::Migration
  def self.up
    change_table :dramas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dramas, :image
  end
end
