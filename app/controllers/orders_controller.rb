class OrdersController < ApplicationController
    def index
      @orders = Order.all
      render json: @orders
    end
  
    def show
      @order = Order.find(params[:id])
      render json: @order, include: :order_details
    end
    
    def create
      @user = User.find(params[:id])
      if @user
        @order = @user.orders.build(order_params)
        if @order.save
          render json: { status: 'created' }
        else
          render json: { error: @order.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
  
    def destroy
      @order = Order.find(params[:id])
      if @order.destroy
        head :no_content
      else
        render json: { error: @order.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def order_params
      params.require(:order).permit(:shippingaddress, :user)
    end
  end
  