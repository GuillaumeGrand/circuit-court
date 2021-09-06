module Stripe
    
    class FileUpload < ApplicationService
        attr_reader :document, :purpose
        def initialize(document, purpose)
            @document = document
            @purpose = purpose
        end

        def call
            Stripe.api_key = ENV['STRIPE_SECRET_KEY']
            Stripe::File.create({
                file: document.tempfile,
                purpose: purpose,
            })
        end
    end
end