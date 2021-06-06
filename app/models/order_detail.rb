class OrderDetail < ApplicationRecord
  belongs_to :user
  has_one :payment_detail
  has_many :order_items
end
