class OrderDetailsController  < ApplicationController
    # before_action :authenticate_consumer, only: [:show]
    before_action :authenticate_retailer, only: [:edit, :show]
    def show
        @items = current_user.store.order_details.find(params[:id]).order_items
    end

    def index
        @orders = current_user.store.order_details
    end

    def update; end
end