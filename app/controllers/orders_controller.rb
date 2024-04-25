class OrdersController < ApplicationController
    def index
        @orders = Order.all
        render json: @orders
    end

    def show
        @order = Order.find(params[:id])
        render json: @order
    end
end
