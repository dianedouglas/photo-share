class AddAttachmentImageUploadToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :image_upload
    end
  end

  def self.down
    remove_attachment :posts, :image_upload
  end
end
