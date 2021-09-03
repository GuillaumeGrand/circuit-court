class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.integer :SKU
      t.decimal :price_cents
      t.references :store

      t.timestamps
    end
  end
end
