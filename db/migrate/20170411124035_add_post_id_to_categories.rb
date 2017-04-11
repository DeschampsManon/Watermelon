class AddPostIdToCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :admin_categories, :post_ids
    add_column :admin_categories, :post_id, :integer
  end
end
