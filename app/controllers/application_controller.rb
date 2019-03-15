class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :sanitize_params, if: :devise_controller?

  def sanitize_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:address, :photo, :photo_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:address, :photo, :photo_cache])
  end
end
