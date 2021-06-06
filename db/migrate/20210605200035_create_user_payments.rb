class CreateUserPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_payments do |t|
      t.string :payment_type
      t.string :provider
      t.integer :account_no
      t.date :expiry
      t.references :user

      t.timestamps
    end
  end
end
