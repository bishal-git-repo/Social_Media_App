Rails.application.routes.draw do
  #Authentication routes
  post '/signup', to: 'users#create'
  post '/login', to: 'authentication#login'
  post '/logout', to: 'authentication#logout'

  #Post routes
  resources :posts, only: [:index, :show, :create, :update, :destroy]

  #User routes
  resources :users, only: [:show] do
    member do
      get :posts
    end
  end
  root 'posts#index'
end
