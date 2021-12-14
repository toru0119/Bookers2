Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :edit, :destroy, :index, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
