Rails.application.routes.draw do

  get 'items/index'
  get 'items/show'
  root to: 'items#index'

  get 'artisan/new'
  get 'artisan/create'
  get 'artisan/show'
  get 'artisan/index'
  get 'artisan/edit'
  get 'artisan/update'
  get 'artisan/destroy'
  
  devise_for :artisans
	resources :carts
	resources :orders
	resources :items
end