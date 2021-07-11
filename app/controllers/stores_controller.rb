class StoresController < ApplicationController
  before_action :authenticate_retailer, except: [:index]

  def index
    @stores = Store.includes([photo_attachment: :blob]).all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.create(store_params)
    @store.user = User.find(current_user.id)
    # CreateSubscription.new(current_trader).call
    @store.save!

    redirect_to :controller => 'stores', :action => 'index'
  end

  private

  def store_params
    params.require(:store).permit(:presentation, :name, :photo)
  end
end
