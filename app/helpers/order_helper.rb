module OrderHelper
	def order_count_items(id)
		total = 0
		Order.find(id).order_items.each do |order_item|
			total += order_item.quantity
		end
		return total	
	end
end
