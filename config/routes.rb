Rails.application.routes.draw do
  devise_for :users
  root to:'stores#index'

  resources :stores do
    resources :products, only: %i[index new create show]
  end

  get '/dashboard', to: 'users#dashboard', as: :dashboard

  post '/cart/:product_id/:quantity', to: 'carts_items#add_product_to_cart', as: :add_product_to_cart
end
