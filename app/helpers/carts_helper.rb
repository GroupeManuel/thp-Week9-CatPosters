
module CartsHelper


	def current_cart
		if artisan_signed_in? && Cart.find_by(artisan_id:current_artisan.id) != nil
			return Cart.find_by(artisan_id:current_artisan.id)
		elsif artisan_signed_in? && Cart.find_by(artisan_id:current_artisan.id) == nil
			new_cart = Cart.create(
					artisan_id: current_artisan.id,
			      	status: 'created'
					)
			return new_cart
		else
			if Cart.find_by(status:'default') == nil
				cart = Cart.create!(status:'default')
				return cart
			else
				return Cart.find_by(status:'default')
			end
		end
	end

	def current_cart_items
		if artisan_signed_in?
			current_cart.cart_items
		else
			{}
		end
	end

	def show_current_cart
		if artisan_signed_in?
			current_cart_items.each {|item|
				puts Item.find(item.item_id).title
			}
		else 
			return ['']
		end
	end


	def current_cart_price
		if artisan_signed_in?
		    total_price = 0
		    current_cart_items.each { |item|
		      total_price += item.quantity * item.price 
		    }
		    return total_price
		else 
			return 0
		end
	end

	def current_cart_count
		if artisan_signed_in?
		    total_count = 0
		    current_cart_items.each { |item|
		      total_count += item.quantity
		    }
		    return total_count
		else
			return 0
		end
	end

end
