Rails.application.routes.draw do
	root to: 'items#index'
	devise_for :artisans, controller: {sessions: 'artisans/sessions'}
	resources :carts, only: [:show, :update]
	resources :orders, only: [:create, :show]
	resources :items, only: [:index, :show]
	resources :cart_items, only: [:create]
  resources :artisans
end
