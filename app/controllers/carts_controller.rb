class CartsController < ApplicationController
  def create
  end

  def edit
    @cart = Cart.find(params[:id])
  	@cart_amount = cart_price(@cart.id)
  	@items = @cart.cart_items.order(:id)
    
    #Statut modifié
    if @cart.status = 'created'
      @cart.status = 'displayed'
      @cart.save
    end

  end

  def update

  end



 private 
  
  def cart_price(id)
    total_price = 0
    CartItem.where(cart_id: id).each { |item|
      total_price += item.quantity * item.price 
    }
    return total_price
  end

end
