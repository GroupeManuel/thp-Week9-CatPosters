class OrdersController < ApplicationController
  
  def new
  end

  def create
  	cart = Cart.find(params['cart'])

 	# Création de l'order
  	order = Order.create(
  		delivery_address: params['address'],
  		artisan: cart.artisan
  		)

  	# Création des items dans la table order_items
  	cart.cart_items.each { |item|
  		create_order_item(item,order)
  	}
  	#Vidange du panier
  	empty_cart(cart)

  	redirect_to root_path

  end

  def show
  	@order = Order.find(params[:id])
  end
  
  private 

	def empty_cart(cart)
		cart.cart_items.destroy_all
		cart.destroy
	end

	def create_order_item(item, order)
		OrderItem.create(
  			quantity: item.quantity,
  			item_id: item.id,
  			price: item.price, 
  			order: order
  			)
	end 
end
