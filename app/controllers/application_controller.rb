class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :sanitize_params, if: :devise_controller?



def sanitize_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:address])

end

  end
