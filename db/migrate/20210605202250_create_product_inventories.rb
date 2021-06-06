class CreateProductInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_inventories do |t|
      t.integer :quantity
      t.references :product

      t.timestamps
    end
  end
end
