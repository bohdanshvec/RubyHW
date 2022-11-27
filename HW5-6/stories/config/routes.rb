Rails.application.routes.draw do
  root "api/v1/articles#index"
  
  namespace :api do
    namespace :v1 do
      resources :articles
      resources :comments, only: %i[index update]
    end
    # v2 created for visibility
    namespace :v2 do
    end
  end
end