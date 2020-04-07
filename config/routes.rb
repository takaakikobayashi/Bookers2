Rails.application.routes.draw do

  get 'home/index'
  get "home/about"
  devise_for :users

  get "users/:id" => "users#show", as: "show_user"
  delete "books/:id" => "books#destroy", as: "destroy_book"

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :users, only: [:new, :create, :index, :show, :edit, :update, :sessions, :paswords, :registrations]
end