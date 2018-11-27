class ArtisanController < ApplicationController

  skip_before_action :authenticate_artisan!, only: [:new, :index]

  def new
  end

  def create
    puts new_email = params['artisan']['email']
    Mailing.new.new_subscriber(new_email)
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
