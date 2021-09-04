module Stripe
  class UpdateRetailerAccount < ApplicationService
    attr_reader :account_id
    def initialize(account_id)
      @account_id = account_id
    end

    def call
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      Stripe::Account.update(
        account_id,
        business_profile: {
          product_description: 'product_description',
          mcc: '5734',
        },
        capabilities: {
          transfers: { requested: true }
        },
      )
    end
  end
end
