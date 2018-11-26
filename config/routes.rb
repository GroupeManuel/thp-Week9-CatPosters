Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
	root to: 'items#index'
  	devise_for :artisans
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :carts
	resources :orders
	resources :items
end
