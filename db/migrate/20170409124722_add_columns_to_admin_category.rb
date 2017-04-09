class AddColumnsToAdminCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_categories, :description, :text
  end
end
