Rails.application.routes.draw do
	root to: 'items#index'
  	devise_for :artisans
	resources :carts, only[:show, :update]
	resources :orders, only: [:create, :show]
	resources :items, only: [:index]
	resources :cart_items, only: [:create]

end
