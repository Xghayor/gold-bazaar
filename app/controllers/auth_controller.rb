class AuthController < ApplicationController
  skip_before_action :authenticate_with_api_key, only: [:login]
  skip_before_action :authorize_user, only: [:login]

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: { status: "Welcome to Gold Bazaar", api_key: user.api_key }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
