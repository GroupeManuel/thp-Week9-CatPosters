Rails.application.routes.draw do
	get '/', to: 'items#index'
	get '/home', to: 'items#index'
	root to: 'items#index'
  	devise_for :artisans
	resources :carts, only: [:edit, :update]
	resources :orders, only: [:create, :show]
	resources :items, only: [:index, :show]
	resources :cart_items, only: [:create, :update, :destroy]
end
