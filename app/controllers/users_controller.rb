class UsersController < ApplicationController
  skip_before_action :authenticate_with_api_key, only: [:create]
  skip_before_action :authorize_user, only: [:create]

  
    def show
     render json: @current_user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: { status: "created" }
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
          head :no_content
        else
          render json: { error: "User couldn't be deleted" }, status: :unprocessable_entity
        end
      end
      
  
    private
  
    def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :email, :password_digest)
    end
  end
  