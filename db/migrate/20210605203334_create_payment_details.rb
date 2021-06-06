class CreatePaymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_details do |t|
      t.decimal :amount
      t.string :provider
      t.string :status
      t.references :order_detail

      t.timestamps
    end
  end
end
