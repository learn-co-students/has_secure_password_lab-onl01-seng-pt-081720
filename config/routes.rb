Rails.application.routes.draw do

  resources :users
  resources :sessions
  # get '/welcome' => 'users#welcome'
  get '/:id', to: 'users#welcome', as: 'welcome'

end
