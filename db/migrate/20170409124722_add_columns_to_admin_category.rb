class AddColumnsToAdminCategory < ActiveRecord::Migration[5.0]
  def change
    change_column :admin_posts, :category_id, :array
  end
end
