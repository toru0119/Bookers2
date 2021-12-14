Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
