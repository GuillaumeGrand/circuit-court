module Stripe
  class  CreateAcount < ApplicationService
    require 'stripe'

    def initialize(country, email)

    end

    def call
      Stripe::Account.create({
        type: 'custom',
        country: 'US',
        email: 'jenny.rosen@example.com',
        capabilities: {
          card_payments: {requested: true},
          transfers: {requested: true},
        },
      })
    end
  end
end
