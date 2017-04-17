class CreateAdminMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_menus do |t|
      t.string :name
      t.boolean :active
      t.text :links, array: true, default: []
      t.timestamps
    end
  end
end
