Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/home' => 'home#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


    resources :photos do
      resources :comments
      resources :tags

  end
end
