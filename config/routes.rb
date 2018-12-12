Rails.application.routes.draw do
  root 'pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/microposts/rank', to: 'microposts#rank'
  get '/microposts/anew', to: 'microposts#anew'
  resources :users
  resources :microposts , only: [:new, :show, :create , :destroy ] do
        resources :comments
  end

  # ここからフォロー
  post 'users/:id/follow', to: 'users#follow', as: 'follow'
  delete 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'

  get 'users/:id/follow_list',
      to: 'users#follow_list',
      as: 'follow_list'

  get 'users/:id/follower_list',
      to: 'users#follower_list',
      as: 'follower_list'
end
