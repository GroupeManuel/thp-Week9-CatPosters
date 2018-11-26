Rails.application.routes.draw do

	root to: 'item#index'
  	devise_for :artisans
	resources :carts
	resources :orders
	resources :items
end
