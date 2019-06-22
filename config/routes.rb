Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :makers
  resources :colors  do
    resources :likes, only: [:create, :destroy]
  end
  get 'home/index'
  get 'home/search'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
