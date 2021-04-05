Rails.application.routes.draw do
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  
  resources :weekdays
  resources :menus
  resources :menu_items
  resources :users, only: [:create, :update]
end
