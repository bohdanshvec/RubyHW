Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root "products#index"

  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]

end
