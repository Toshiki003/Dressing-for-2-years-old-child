Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root to: 'static_pages#top'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms', to: 'static_pages#terms'

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'guest_login', to: 'user_sessions#guest_login'

  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :search
      get :most_liked
      get :most_bookmarked
      get :conprehensive
    end
  end
  resources :likes, only: %i[index create destroy]
  resources :bookmarks, only: %i[index create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

  resources :articles, only: %i[index]
end
