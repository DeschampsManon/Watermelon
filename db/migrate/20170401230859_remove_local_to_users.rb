class RemoveLocalToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :locale
  end
end
