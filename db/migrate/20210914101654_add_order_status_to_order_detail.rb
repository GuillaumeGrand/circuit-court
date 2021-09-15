class AddOrderStatusToOrderDetail < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :order_status, :string
  end
end
