class DropTableCategoryPost < ActiveRecord::Migration[5.0]
  def change
    drop_table :categories_posts
    add_column :admin_categories, :post_ids, :integer, array: true, default: []
  end
end
