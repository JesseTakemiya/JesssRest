require 'sidekiq/web'

Rails.application.routes.draw do
  resources :order_details
  resources :payments
  resources :bills
  resources :menu_inventories
  resources :coupon_usages
  resources :orders
  resources :tables
  resources :reservations
  resources :feedbacks
  resources :inventories
  resources :menus
  resources :coupons
  resources :employees
  resources :customers
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
