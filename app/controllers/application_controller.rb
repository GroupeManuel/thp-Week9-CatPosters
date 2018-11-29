class ApplicationController < ActionController::Base
	before_action :authenticate_artisan!
  	include CartsHelper

  	def destroy
  		super
  		current_cart
  	end

end
