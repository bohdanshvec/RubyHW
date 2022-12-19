Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root "api/v1/articles#index"

  namespace :api do
    namespace :v1 do
      resources :articles 
      resources :authors, only: %i[index create destroy]
      resources :comments, only: %i[index show create update destroy]
      resources :tags, only: %i[index create destroy]
      resources :likes, only: %i[index create] 
      post 'articles/:article_id/tags/:id', to: 'articles#tag_add'
    end
  end
end