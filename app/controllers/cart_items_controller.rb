class CartItemsController < ApplicationController

  def create
  	if Artisan.first.cart == nil
  		  cart = Cart.create(
        artisan: Artisan.first
        )
    else 
      cart = Artisan.first.cart
  	end

    puts cart

    item_id = params['item']

  	CartItem.create(
  		cart: cart,
  		item_id: Item.find(item_id).id,
      quantity: 1,
      price: Item.find(item_id).price
      )

  	redirect_back fallback_location: cart_path(cart.id)

  end

  def update
  end

  def destroy
  end
end
