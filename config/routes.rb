Rails.application.routes.draw do
  root 'pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/microposts/rank', to: 'microposts#rank'
  resources :users
  resources :microposts , only: [:new, :show, :create , :destroy ] do
        resources :comments
  end
end
