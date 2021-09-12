module Stripe
  class UpdateRetailerAccount < ApplicationService
    attr_reader :account_id, :token
    def initialize(account_id, token)
      @account_id = account_id
      @token = token
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
        account_token: token
      )
    end
  end
end
