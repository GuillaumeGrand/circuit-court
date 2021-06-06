class OrderItem < ApplicationRecord
  has_one :order_detail
  has_one :product
end
