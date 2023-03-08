# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'products#index'

  # resources :categories, only: %i[index show]
  resources :products, only: %i[index show]
  get '/cart', to: 'carts#show', as: 'cart'
  resources :line_items, only: %i[create destroy]
  resources :orders, only: %i[create show update index destroy]
  post 'line_items/:id/plus', to: 'line_items#quantity_plus', as: 'line_item_quantity_plus'
  post 'line_items/:id/reduce', to: 'line_items#quantity_reduce', as: 'line_item_quantity_reduce'
end
