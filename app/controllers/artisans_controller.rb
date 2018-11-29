class ArtisansController < ApplicationController
	skip_before_action :authenticate_artisan!, only: [:new, :index]

  def new
  end	

  def show
  end

  def edit
  end

  def update
  end

  def create
  	puts new_email = params['artisan']['email']
    Mailing.new.new_subscriber(new_email)
  end
end
