class OrderDetailsController < ApplicationController
    def create
      @order = Order.find(params[:order_id])
      @product = Product.find(params[:product_id])
  
      @order_detail = @order.order_details.new(order_detail_params)
      @order_detail.product = @product
  
      if @order_detail.save
        render json: @order_detail, status: :created
        @order.orderstatus = "completed"
        @order.save
      else
        render json: @order_detail.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def order_detail_params
      params.require(:order_detail).permit(:quantity, :unitprice)
    end
  end
  