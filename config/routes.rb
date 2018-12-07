Rails.application.routes.draw do
  root 'pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :microposts, only: [:new, :create, :destroy] do
    resources :comments, only: [:create]
  end
end
