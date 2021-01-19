Rails.application.routes.draw do
  resources :users
  get "/sessions/new", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/homepage", to: "welcome#homepage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
