class ItemsController < ApplicationController
	skip_before_action :authenticate_artisan!, only: [:index, :show]

  def index
    @items = Item.all
    @cart = Cart.find_by artisan_id: Artisan.first.id
  end

  def show
    @item = Item.find(params[:id])
  end
end
