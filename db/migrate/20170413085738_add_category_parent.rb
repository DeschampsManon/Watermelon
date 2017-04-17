class AddCategoryParent < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_categories, :parent_id, :integer
  end
end
