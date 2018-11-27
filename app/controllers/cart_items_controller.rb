class CartItemsController < ApplicationController

  def create

    #Création du panier
	  cart = Cart.create(
      artisan: Artisan.first,
      status: 'created'
    )

    item_id = params['id']

  	#Création du premer cart_item
    CartItem.create(
  		cart: cart,
  		item_id: Item.find(item_id).id,
      quantity: 1,
      price: Item.find(item_id).price
      )
  	redirect_back fallback_location: edit_cart_path(cart.id)

  end

  def update

    cart_item = CartItem.find(params['id'])
    cart = Cart.find(cart_item.cart_id)

    #Création du premier cart_item
    if params['modif'] == '-'
      cart_item.quantity -= 1
    else
      cart_item.quantity += 1
    end

    #Cas d'une quantité de base =1
    if cart_item.quantity == 0
      cart_item.destroy
      #Cas de réduction du dernier item à une quantité 0
      if CartItem.where(cart_id: cart.id).count == 0
        cart.destroy
        redirect_to root_path and return
        #ajouter un message flash après la redirection
      end
    end

    cart_item.save

    cart.status = 'updated'
    cart.save

    redirect_back fallback_location: root_path
  end

  def destroy
  end
end
