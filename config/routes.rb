# frozen_string_literal: true

Rails.application.routes.draw do
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  put '/change', to: 'users#change_credentials'
  get '/user_orders', to: 'orders#user_orders'
  patch '/orders/:id', to: 'orders#status'

  resources :weekdays do
    resources :menu_items do
    end
    resource :menus
    resources :orders, only: [:create]
  end

  resources :orders
  resources :menu_items
  resources :users, only: %i[create update index]
end
