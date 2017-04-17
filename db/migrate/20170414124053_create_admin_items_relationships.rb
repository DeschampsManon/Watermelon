class CreateAdminItemsRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_items_relationships do |t|
      t.integer :menu_id
      t.integer :post_id
      t.integer :category_id
      t.integer :page_id
      t.timestamps
    end
  end
end
