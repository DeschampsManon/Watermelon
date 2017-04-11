class RemoveFieldPostTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :admin_posts, :thumbnail_id
  end
end
