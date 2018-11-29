Rails.application.routes.draw do
  get 'artisans/edit'
  get 'artisans/update'
  get 'artisans/create'
	get '/', to: 'items#index', as: 'root'
  	devise_for :artisans
	resources :artisans, only: [:edit, :show, :update]
#	get '/artisans/sign_up/:id', to: '/artisans/sign_up'
	resources :carts, only: [:edit, :update]
	resources :orders, only: [:create, :show]
	resources :items, only: [:index, :show]
	resources :cart_items, only: [:create, :update, :destroy]
end
