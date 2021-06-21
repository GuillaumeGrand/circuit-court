class AddStoreIdInProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :store_id, :integer
    add_foreign_key :products, :stores
  end
end
