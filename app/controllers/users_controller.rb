class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
      end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new!(user_params)
        if @user.save
            render json: status: "created"
        else
            render json: unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end
end
