class OrderDetailsController  < ApplicationController
    def show
        @orders = current_user.order_details
    end
end