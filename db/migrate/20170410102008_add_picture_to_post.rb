class AddPictureToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_posts, :picture_id, :integer
  end
end
