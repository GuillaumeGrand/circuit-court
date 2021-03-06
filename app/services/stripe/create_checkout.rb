module Stripe
  class CreateCheckout < ApplicationService
    attr_reader :items, :base_url, :store_id, :total
    def initialize(items, base_url, store_id)
      @items = items
      @base_url = base_url
      @store_id = store_id
      @total = total_amount
    end

    def call
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      Stripe::Checkout::Session.create({
                                        payment_method_types: ['card'],
                                          line_items: [{
                                            name: items[0].store.name,
                                            amount:  total,
                                            currency: 'eur',
                                            quantity: 1
                                          }],
                                        payment_intent_data: {
                                          application_fee_amount: 0,
                                          transfer_data: {
                                            destination: items[0].store.user.stripe_account
                                          }
                                        },
                                        mode: 'payment',
                                        success_url: @base_url + "/checkout/success/" + store_id + "/" + total.to_s,
                                        cancel_url: @base_url
                                        })

    end
    private

    def total_amount
      total = 0
      items.each do |item|
        total += ((item.product.price_cents * item.quantity) * 100)
      end
      return total
    end
  end
end
