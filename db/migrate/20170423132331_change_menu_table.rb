class ChangeMenuTable < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_items_relationships, :parent_id, :integer
    add_column :admin_items_relationships, :classe, :string
    add_column :admin_items_relationships, :position, :integer
    remove_column :admin_menus, :links
  end
end
