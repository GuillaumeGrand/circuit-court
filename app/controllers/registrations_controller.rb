class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    resource.user_type == "retailer" ?
      new_retailer_identification_path :
      new_customer_identification_path
  end
end
