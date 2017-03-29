class CreateAdminPages < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_pages do |t|
      t.string :name
      t.text :source
      t.boolean :is_index, default: false
      t.string :meta_description
      t.string :page_title
      t.timestamps
    end
  end
end
