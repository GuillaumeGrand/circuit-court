class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if:  :devise_controller?

  def authenticate_retailer_user
    ternary_for_user_type("retailer")
  end

  def authenticate_consumer_user
    ternary_for_user_type("customer")
  end

  def ternary_for_user_type(user)
    current_user.user_type == user ? authenticate_user! : redirect_to(:root)
  end

protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])

  end
end
