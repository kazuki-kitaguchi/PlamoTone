Rails.application.routes.draw do
  resources :kinds
  resources :makers
  get 'home/index'
  get 'home/search'
  resources :colors
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
