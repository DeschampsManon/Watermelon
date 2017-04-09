class Rename < ActiveRecord::Migration[5.0]
  def change
    rename_column :admin_posts, :category_id, :category_ids
  end
end
