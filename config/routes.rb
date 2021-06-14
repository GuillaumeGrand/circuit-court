Rails.application.routes.draw do
  devise_for :users
  root to:'stores#index'

  resources :stores do
    resources :products, only: %i[index new create]
  end
end
