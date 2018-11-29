class OrdersController < ApplicationController
  
  def new
  end

  def create

 	# Création de l'order
  	order = Order.create(
  		delivery_address: params['address'],
  		artisan: current_cart.artisan
  		)

  	# Création des items dans la table order_items
  	current_cart_items.each { |item|
  		create_order_item(item,order)
  	}
  	#Vidange du panier
  	empty_cart(current_cart)

    #Envoi email confirmation : récupère email puis active le mailing.rb
    buyer_email = Artisan.find(Order.last.artisan_id).email
    Mailing.new.new_buyer(buyer_email)

  	redirect_to order_path(order.id)

  end

  def show
  	@order = Order.find(params[:id])
  end
  
  private 

	def empty_cart(cart)
		cart.cart_items.destroy_all
	end

	def create_order_item(item, order)
		OrderItem.create(
  			quantity: item.quantity,
  			item_id: item.id,
  			price: item.price, 
  			order_id: order.id
  			)
	end 
end
