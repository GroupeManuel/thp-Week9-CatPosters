class CartController < ApplicationController
  def create
  	
  end

  def show
	@cart = Cart.find(params[:cart_id])
  	@cart_total_price = cart_price(@cart.id)

  end

  def update
  end
end
