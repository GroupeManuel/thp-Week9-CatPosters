module CartsHelper
	
	def current_cart
		if Cart.find_by(artisan_id:Artisan.first.id) == nil
			new_cart = Cart.create(
				artisan_id:Artisan.first.id,
		      	status: 'created'
				)
			puts 'Cart #{new_cart.id} just created' 
			return new_cart
		else
			puts 'Cart #{Cart.find_by(artisan_id:Artisan.first.id).id} just selected' 
			return Cart.find_by(artisan_id:Artisan.first.id)
		end
	end

	def current_cart_items
		current_cart.cart_items
	end

	def show_current_cart
		current_cart_items.each {|item|
			puts Item.find(item.item_id).title
		}
	end


	def current_cart_price
	    total_price = 0
	    current_cart_items.each { |item|
	      total_price += item.quantity * item.price 
	    }
	    return total_price
	end

	def current_cart_count
	    total_count = 0
	    current_cart_items.each { |item|
	      total_count += item.quantity
	    }
	    return total_count
	end

end
