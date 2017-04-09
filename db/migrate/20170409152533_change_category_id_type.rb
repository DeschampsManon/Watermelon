class ChangeCategoryIdType < ActiveRecord::Migration[5.0]
  def change
    change_column :admin_posts, :category_id, 'text[] USING ARRAY[category_id]::INTEGER[]', array: true, default: []
  end
end
