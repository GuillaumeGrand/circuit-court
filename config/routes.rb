Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to:'stores#index'

  resources :checkouts, only: %i[create]
  resources :retailer_identifications
  resources :customer_identifications
  resources :cart_items, only: %i[index create update destroy]
  resources :stores do
    resources :products
  end

  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/dashboard_index', to: 'products#dashboard_index', as: :dashboard_index

end
