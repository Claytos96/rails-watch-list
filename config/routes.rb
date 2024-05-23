Rails.application.routes.draw do

  resources :lists
  get 'lists/:list_id/bookmarks/new', to: 'lists#new_bookmark', as: 'new_bookmark'
  post 'lists/:list_id/bookmarks', to: 'lists#create_bookmark', as: 'bookmarks'
  delete 'bookmarks/:id', to: 'lists#destroy_bookmark'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
