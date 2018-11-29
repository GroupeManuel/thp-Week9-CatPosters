include CartsHelper

class ItemsController < ApplicationController
  
	skip_before_action :authenticate_artisan!, only: [:index, :show]

  def index
  	current_cart
  	current_cart_items
  	puts 'debut'
  	puts current_cart.id
  	puts current_cart_items
  	puts 'fin'
  end

  def show
    @item = Item.find(params[:id])
  end

end
