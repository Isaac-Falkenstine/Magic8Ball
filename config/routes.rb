Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/register', to: "users#new"
  post '/register', to: "users#create"

  resources :users, only: [:create]

  get '/dashboard', to: "users#show", as: "dashboard"
end
