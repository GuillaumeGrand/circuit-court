class AddStoreIdInShoppingSession < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_sessions, :store_id, :integer
    add_foreign_key :shopping_sessions, :stores
  end
end
