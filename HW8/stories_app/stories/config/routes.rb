Rails.application.routes.draw do
  root "api/v1/articles#index"

  namespace :api do
    namespace :v1 do
      resources :articles #do
        # post 'like', on: :member
      # end
      resources :authors, only: %i[index create destroy]
      resources :comments, only: %i[index show create update destroy] #do
        # post 'like', on: :member
      # end
      resources :tags, only: %i[index create show destroy]
      resources :likes, only: %i[index] do
        post 'like', on: :collection
      end
      get 'articles/:article_id/tags/:id', to: 'articles#tag_add'
    end
  end
end
