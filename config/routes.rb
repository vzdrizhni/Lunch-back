Rails.application.routes.draw do
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  
  resources :weekdays do    
      post "/menu_items/:id", to: "menus#create"  
  end
  
  resources :menu_items
  resources :users, only: [:create, :update]
end
