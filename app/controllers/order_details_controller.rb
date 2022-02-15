class OrderDetailsController  < ApplicationController
    # before_action :authenticate_consumer, only: [:show]
    before_action :authenticate_retailer, only: [:edit, :show]
    def show
        @items = current_user.store.order_details.find(params[:id]).order_items
    end

    def index
        @orders = current_user.store.order_details.where(order_status: "pending")
    end

    def histo_index
        @orders = current_user.store.order_details.where(order_status: "finish")
    end

    def update
        order_detail = current_user.store.order_details.where(id: params[:id]).first
        order_detail.assign_attributes(order_params)
        order_detail.save
        redirect_to root_path
    end

    private

    def order_params
        params.permit(:order_status, :id)
    end 
end