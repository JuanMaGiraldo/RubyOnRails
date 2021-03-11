Rails.application.routes.draw do
  root 'articles#index'

  get  '/login',   to: 'sessions#login'
  post '/login',   to: 'sessions#create'
  get  '/logout',  to: 'sessions#logout'

  get '/users/view/:id', to: 'users#view'
  get '/users/follow/:id', to: 'users#follow'
  get '/users/unfollow/:id', to: 'users#unfollow'

  resources :users, only: %i[new create]

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
