Rails.application.routes.draw do
  root "api/v1/articles#index"

  namespace :api do
    namespace :v1 do
      resources :articles
      resources :authors, only: %i[index create destroy]
      resources :comments, only: %i[index create update destroy]
      resources :tags, only: %i[index create show destroy]
    end
  end
end
