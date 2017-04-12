class CreateAdminCategorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_categorizations do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end

    drop_table :categories_posts

    remove_column :admin_posts, :category_ids
    remove_column :admin_categories, :post_id

  end
end
