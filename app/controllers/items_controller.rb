class ItemsController < ApplicationController
  
	skip_before_action :authenticate_artisan!, only: [:index, :show]

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

end
