class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.decimal :total
      t.integer :quantity
      t.references :product
      t.references :store
      t.references :user

      t.timestamps
    end
  end
end
