Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/users/query", to: "users#query"
      patch "/projects/complete", to: "projects#complete"
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/current_user', to: 'auth#show'
      post '/transactions/contribute', to: 'transactions#contribute'
      post "/graphql", to: "graphql#execute"
      resources :users, only: [:index, :show, :create]
      resources :projects, only: [:index, :create, :update]
      resources :transactions, only: [:index, :create]
    end
  end

end
