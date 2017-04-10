class AddFieldsToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_pictures, :alt, :string
  end
end
