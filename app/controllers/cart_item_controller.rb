class CartItemController < ApplicationController
  def create
	Artisan.first.cart != nil
		@cart = Cart.new
		@cart.artisan = Artisan.first
  	end

  	CartItem.create(
  		cart_id: @cart.id
  		)

  	redirect_back fallback_location: cart
  end

  def update
  end

  def destroy
  end
end
