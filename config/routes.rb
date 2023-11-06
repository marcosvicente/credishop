Rails.application.routes.draw do
  get 'relatory/index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'  
  
  get 'inss/calculation'
  resources :proponents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "proponents#index"
end
