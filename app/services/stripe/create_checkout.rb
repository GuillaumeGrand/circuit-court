module Stripe
  class CreateCheckout < ApplicationService
    attr_reader :items, :base_url, :store_id
    def initialize(items, base_url, store_id)
      @items = items
      @base_url = base_url
      @store_id = store_id
    end

    def call
      Stripe::Checkout::Session.create({
                                        payment_method_types: ['card'],
                                          line_items: [{
                                            name: items[0].store.name,
                                            amount: total,
                                            currency: 'eur',
                                            quantity: 1
                                          }],
                                        payment_intent_data: {
                                          application_fee_amount: 0,
                                          transfer_data: {
                                            destination: items[0].store.user.stripe_account
                                          }
                                        },
                                        success_url: @base_url + "/checkouts/success/#{@store_id}",
                                        cancel_url: @base_url
                                        })

    end
    private

    def total
      total = 0
      items.each do |item|
        total =+ (item.product.price * item.quantity)
      end
      return total
    end

  end
end
