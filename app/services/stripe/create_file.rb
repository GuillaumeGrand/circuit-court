module Stripe
  class CreateFile < ApplicationService
    def initialize(file, account)
      @file = file
      @account = account
    end

    def call
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      Stripe::File.create({
                            purpose: 'identity_document',
                            file: File.new(@file)
                          }, {
                            stripe_account: @account
                          })
    end
  end
end
