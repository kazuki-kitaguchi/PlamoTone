Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show] do
    resources :likes, only: :destroy
  end
  resources :makers
  resources :colors  do
    resources :likes, only: [:create, :destroy]
  end
  get 'home/index'
  post 'users/:id', to: 'users#show'
  get 'home/search'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
