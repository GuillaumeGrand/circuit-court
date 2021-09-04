module Stripe
  class LinkRetailerAccount < ApplicationService
    attr_reader :account, :retailer, :base_url

    def initialize(account, base_url, retailer)
      @account = account
      @base_url = base_url
      @retailer = retailer
    end

    def call
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      account_links = Stripe::AccountLink.create({
                                                   account: account['id'],
                                                   refresh_url: base_url,
                                                   return_url: base_url,
                                                   type: 'account_onboarding'
                                                 })
      update_retailer
    end

    private

    def update_retailer
      retailer.update(stripe_account: account['id'])
    end
  end
end
