module Stripe
  class  CreateRetailerAccount < ApplicationService
    require 'stripe'
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def call
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      account = Stripe::Account.create({
                                       country: 'FR',
                                       business_profile: {
                                          product_description: 'product_description',
                                          mcc: '5734',
                                       },
                                       capabilities: {
                                          card_payments: { requested: true},
                                          transfers: { requested: true }
                                       },
                                       type: 'custom',
                                       account_token: token
                                     })
    end
  end
end
