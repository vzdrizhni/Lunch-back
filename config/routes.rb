# frozen_string_literal: true

Rails.application.routes.draw do
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'

  resources :weekdays do
    resources :menu_items do
    end
    resources :orders, only: [:create]
  end

  resources :orders
  resources :menu_items
  resources :users, only: %i[create update index]
end
