class CreateAdminPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_pictures do |t|
      t.string :title
      t.timestamps
    end
  end
end
