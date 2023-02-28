Rails.application.routes.draw do
  root to: 'static_pages#top'

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'guest_login', to: 'user_sessions#guest_login'

  resources :posts
  post 'like/:id', to: 'likes#create', as: 'create_like'
  delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'
  resources :posts do
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]

end
