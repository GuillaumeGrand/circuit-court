class RetailerIdentificationsController < ApplicationController
  def new
    @retailer = User.find(current_user.id)
  end

  def create
    retailer = User.find(current_user.id)
    account = Stripe::CreateRetailerAccount.call(params['token-account'])
    Stripe::LinkRetailerAccount.call(account, base_url, retailer)
    
    # Stripe::FileUpload.call(params[:front], 'account_requirement')
    # Stripe::FileUpload.call(params[:back], 'account_requirement')

    redirect_to root_path
  end

  def edit
  end

  def update
    user = User.find(current_user.id)
    # foo = Stripe::FileUpload.call(params[:front], 'account_requirement')
    # Stripe::FileUpload.call(params[:back], 'account_requirement')
    
    Stripe::UpdateRetailerAccount.call(user.stripe_account)
    redirect_to dashboard_path
  end
end
