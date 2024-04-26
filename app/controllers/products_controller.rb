class ProductsController < ApplicationController
    def index
      @products = Product.all
      render json: @products
    end
  
    def show
      @product = Product.find(params[:id])
      render json: @product
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        render json: { status: "created" }
      else
        render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      if @product.destroy
        head:no_content
        render json: { status: 'deleted' }
      else
        render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
  end
  