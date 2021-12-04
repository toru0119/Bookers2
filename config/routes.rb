Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'homes#top'
  get'home/about' => 'homes#about'
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :destroy, :index, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
