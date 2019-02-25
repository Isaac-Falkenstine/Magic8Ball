Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/register', to: "users#new"
  post '/register', to: "users#create"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  resources :users, only: [:create]

  get '/dashboard', to: "users#show", as: "dashboard"
  post '/advice', to: "advices#create"
  get '/advice', to: "advices#index"
end
