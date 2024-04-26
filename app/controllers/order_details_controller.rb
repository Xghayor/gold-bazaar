class OrderDetailsController < ApplicationController
  def create
    @order = Order.find_by(id: params[:order_id])
    order_detail_params.each do |order_detail_param|
      @product = Product.find_by(id: order_detail_param[:product_id])
      @order_detail = @order.order_details.build(order_detail_param)
      @order_detail.product = @product
      @order_detail.create
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).map do |param|
      param.permit(:quantity, :unitprice, :product_id)
    end
  end
end