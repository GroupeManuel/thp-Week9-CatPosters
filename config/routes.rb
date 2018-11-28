Rails.application.routes.draw do
	get '/', to: 'items#index', as: 'root'
  	devise_for :artisans
	resources :artisans, only: [:edit, :show, :update]
	resources :carts, only: [:edit, :update]
	resources :orders, only: [:create, :show]
	resources :items, only: [:index, :show]
	resources :cart_items, only: [:create, :update, :destroy]
end
