class OrderDetailsController < ApplicationController
  def create
    @order = Order.find_by(id: params[:order_id])
    order_detail_params.each do |order_detail_param|
      @product = Product.find_by(id: order_detail_param[:product_id])
      @order_detail = @order.order_details.build(order_detail_param)
      @order_detail.product = @product
      if @order_detail.save
        render json: {status: "created"}, status: 201
      else
        render json: {status: "unprocessable_entity"}, status: 422
      end
    end
  end

  private

  def order_detail_params
    params.require(:order_details).map do |param|
      param.permit(:quantity, :unitprice, :product_id)
    end
  end
end