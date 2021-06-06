class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :desc
      t.integer :discount_percent
      t.boolean :activr
      t.references :product

      t.timestamps
    end
  end
end
