class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
      t.string :collection_name, null: false
      t.timestamps
    end
    add_index :collections, :user_id
    add_index :collections, :artwork_id
  end
end
