Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users', to: 'users#index', as: 'users'
  # post 'users', to: 'users#create'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users/:id', to: 'users#edit', as: 'edit_user'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  
    resources :users, only: [:create, :destroy, :index, :show, :update]
    resources :artworks, only: [:create, :destroy, :show, :update]
    resources :artwork_shares, only: [:create, :destroy]

    resources :users do
      resources :artworks, only: [:index]
    end

    resources :comments, only: [:create, :destroy, :index] 

    resources :users do
      member do
        get 'favorited_artworks'
      end
    end

    resources :users do
      member do
        get 'collections'
      end
    end

    # resources :users do
    #   resources :comments, only: [:create, :destroy, :index]
    # end
    # resources :artworks do
    #   resources :comments, only: [:create, :destroy, :index]
    # end

    # get '/:user_id/comments', to: 'comments#index'
    # get '/:artwork_id/comments', to: 'comments#index'
end

