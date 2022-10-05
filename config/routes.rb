Rails.application.routes.draw do
  get '/' => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about' => "home#about"
  get 'index' => "home#index"

  get 'reports/index' => "reports#index"
  get 'reports/new' => "reports#new"
  post 'reports/create' => "reports#create"
  get 'reports/:id' => "reports#show"
  get 'reports/:id/edit' => "reports#edit"
  post 'reports/:id/update' => "reports#update"
  post 'reports/:id/destroy' => "reports#destroy"

  get 'lists/index' => "lists#index"
  get 'lists/new' => "lists#new"
  post 'lists/create' => "lists#create"
  get 'lists/:id/edit' => "lists#edit"
  post 'lists/:id/update' => "lists#update"
  post 'lists/:id/destroy' => "lists#destroy"

  get 'login' => "users#login_form"
  post 'login' => "users#login"
  post 'logout' => "users#logout"
  get 'users/index' => "users#index"
  get 'signup' => "users#new"
  post 'users/create' => "users#create"
  get 'users/:id' => "users#show"
  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"

  post 'checks/:report_id/create' => "checks#create"
  post 'checks/:report_id/destroy' => "checks#destroy"
  
  #resources :messages, only: [:create]
  #resources :rooms, only: [:create,:show]

  post 'messages/create' => "checks#create"

  get 'rooms/1' => "rooms#show"
  post 'rooms/create' => "reports#create"
end
