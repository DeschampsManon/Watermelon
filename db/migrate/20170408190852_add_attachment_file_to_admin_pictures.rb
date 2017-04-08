class AddAttachmentFileToAdminPictures < ActiveRecord::Migration
  def self.up
    change_table :admin_pictures do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :admin_pictures, :file
  end
end
