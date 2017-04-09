class AddColumnsToAdminPost < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_posts, :author, :string
    add_column :admin_posts, :status, :string
    add_column :admin_posts, :thumbnail_id, :integer
  end
end
