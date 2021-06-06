class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :presentation
      t.boolean :display
      t.references :user

      t.timestamps
    end
  end
end
