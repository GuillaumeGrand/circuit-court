class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if:  :devise_controller?

  def authenticate_retailer
    ternary_for_user_type("retailer")
  end

  def authenticate_consumer
    ternary_for_user_type("customer")
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
  end

private

  def ternary_for_user_type(user)
    if current_user
      current_user.user_type == user ? authenticate_user! : redirect_to(:root)
    else
      redirect_to(:new_user_session)
    end
  end
end
