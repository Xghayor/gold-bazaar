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
            render json: status: "created"
        else
            render json: error
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    end
end
