module Stripe
    
    class FileUpload < ApplicationService
        attr_reader :document
        def initialize(document)
            @document = document
        end

        def call
            Stripe::File.create({
                file: File.new(document),
                purpose: 'identity_document',
              })
        end
    end
end