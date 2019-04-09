class RemovesColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :comment_id
    remove_column :likes, :artwork_id
  end
end
