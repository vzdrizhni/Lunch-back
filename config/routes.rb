Rails.application.routes.draw do
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  
  resources :weekdays do
    resources :menus do
      put "/add_food_to_menu/:id", to: "menu_items#add_food"
    end
  end
  
  resources :menu_items
  resources :users, only: [:create, :update]
end
