class OrderDetail < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_one :payment_detail
  has_many :order_items
end
