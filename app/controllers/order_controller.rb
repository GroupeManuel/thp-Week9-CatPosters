class OrderController < ApplicationController
  
  def new
  end

  def create
  	cart = Cart.find(params[:cart])

 	# Création de l'order
  	@order = Order.new
  	@order.delivery_address = params[:address]
  	@order.save

  	# Création des items dans la table order items
  	params[:items].each { |cart_item| create_order_item(cart_item, @order.id) }

  	#Vidange du panier
  	empty_cart(cart.id)

  	redirect_to order_path(@order.id)

  end

  def show
  	@order = Order.find(params[:id])
  end
  
  private 
	
	def cart_price(id)
		total_price = 0
		CartItem.where('cart_id = id').each { |item|
			total_price += item.quantity * item.price 
		}
		return total_price
	end

	def empty_cart(id)
		CartItem.where('cart_id = id').delete_all
		Cart.find(id).delete
	end

	def create_order_item(cart_item, order_id)
		OrderItem.create(
	  		item_id = cart_item.item_id,
	  		quantity = cart_item.quantity,
	  		price = cart_item.price,
	  		order_id = @order.id
		)}

		CartItem.where('cart_id = id').delete_all
		Cart.find(id).delete
	end 
end
