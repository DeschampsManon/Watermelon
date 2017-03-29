class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.boolean :is_index, default: false
      t.text :source
      t.string :meta_description
      t.string :page_title
      t.timestamps
    end
  end
end
