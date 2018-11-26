Rails.application.routes.draw do

  get 'artisan/new'
  get 'artisan/create'
  get 'artisan/show'
  get 'artisan/index'
  get 'artisan/edit'
  get 'artisan/update'
  get 'artisan/destroy'
	root to: 'item#index'
  	devise_for :artisans
	resources :carts
	resources :orders
	resources :items
end
