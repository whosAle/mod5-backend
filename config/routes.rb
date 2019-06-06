Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/users/query", to: "users#query"
      resources :users, only: [:index, :create]
      resources :projects, only: [:index, :create]
      resources :transactions, only: [:index, :create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      post "/graphql", to: "graphql#execute"
    end
  end

end
