Rails.application.routes.draw do
  root "api/v1/articles#index"
  
  namespace :api do
    namespace :v1 do
      resources :articles
    end

    namespace :v2 do
    end
  end
end
