class ApplicationController < ActionController::Base
	before_action :authenticate_artisan!
end
