class EditIndexesForLike < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, [:likeable_type,:likeable_id]
    
  end
end
