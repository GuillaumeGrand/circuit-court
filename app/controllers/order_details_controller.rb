class OrderDetailsController  < ApplicationController
    before_action :authenticate_consumer, only: [:show]
    before_action :authenticate_retailer, only: [:edit]
    def show
        @orders = current_user.order_details
    end

    def index
        @orders = current_user.store.order_details
    end

    def update; end
end