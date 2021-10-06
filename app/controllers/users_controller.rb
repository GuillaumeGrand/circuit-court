class UsersController < ApplicationController
  before_action :authenticate_retailer, except: [:home]

  def home; end

  def dashboard; end
end
