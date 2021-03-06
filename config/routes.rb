Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'homes#top'
  get'home/about' => 'homes#about'
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :destroy, :index, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'users#followings', as: 'followings'
    get 'followers' => 'users#followers', as: 'followers'
  end
  get '/search', to: 'searchs#search'
end
