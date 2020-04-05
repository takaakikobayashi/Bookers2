Rails.application.routes.draw do
  devise_for :users

  delete "books/:id" => "books#destroy", as: "destroy_book"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :users, only: [:new, :create, :index, :show, :edit, :update]
end