class User < ApplicationRecord
  has_one :shopping_session
  has_one :store
  has_one :user_address
  has_many :user_payments
  has_many :order_details
end
