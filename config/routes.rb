Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post "/planners", to: "planners#create"
  delete "/planners", to: "planners#destroy"
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'contact', to: 'welcome#contact'
  get 'map', to: 'welcome#map'
  resources :users, only: [:create, :show, :edit, :update]
  resources :events, only: [:index, :show]
  resources :event_objects, only: [:new, :create, :show]
  resources :itineraries
end
