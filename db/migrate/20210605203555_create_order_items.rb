class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.decimal :quantity
      t.references :product
      t.references :order_detail

      t.timestamps
    end
  end
end
