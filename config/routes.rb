Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
	root to: 'items#index'
  	devise_for :artisans
	resources :carts
	resources :orders
	resources :items
end