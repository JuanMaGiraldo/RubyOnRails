Rails.application.routes.draw do
  root 'sessions#login'

  get  '/login',   to: 'sessions#login'
  post '/login',   to: 'sessions#create'
  get  '/logout',  to: 'sessions#logout'

  resources :users, only: [:new, :create]

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
