class ApplicationController < ActionController::API
  before_action :authenticate_with_api_key
  before_action :authorize_user

  private

  def authenticate_with_api_key
    api_key = request.headers['X-API-KEY']
    @current_user = User.find_by(api_key: api_key)

    unless @current_user
      render json: { error: 'Invalid API key' }, status: :unauthorized
    end
  end

  protected

  def authorize_user(resource_class = User)
    @resource = resource_class.find(params[:id])
    if resource_class == User
      unless @resource == @current_user
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    else
      unless @resource.user_id == @current_user.id
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  end
  
end
