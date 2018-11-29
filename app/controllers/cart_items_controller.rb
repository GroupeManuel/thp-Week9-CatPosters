class CartItemsController < ApplicationController

  def create

    item = Item.find(params['selected_item'])

  	#Création du premer cart_item
    add_to_cart = CartItem.new( 
      cart_id: current_cart.id,
      item_id: item.id,
      quantity: params['quantity'],
      price: item.price
    )
    add_to_cart.save

  	redirect_back fallback_location: edit_cart_path(current_cart.id)

  end

  def update

    puts current_cart.id
    cart_item = CartItem.find_by(cart_id: current_cart.id, item_id: params[:selected_item])
    if cart_item == nil
      create
    end

    #Actualisation de la quantité
    cart_item.quantity += params['quantity'].to_i

    #Cas d'une quantité de base =1
    if cart_item.quantity == 0
      cart_item.destroy
      #Cas de réduction du dernier item à une quantité 0
      if current_cart_items.count == 0
        redirect_to root_path and return
        #ajouter un message flash après la redirection
      end
    end

    cart_item.save

    current_cart.status = 'updated'
    current_cart.save

    redirect_back fallback_location: root_path
  end

  def destroy
    CartItem.find(params['id']).destroy
    redirect_back fallback_location: root_path
  end
end
