class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.decimal :total
      t.references :user
      t.references :store

      t.timestamps
    end
  end
end
