class Item < ApplicationRecord
	has_many :cart_items
	has_many :order_items
	validates :title, :presence => true
	validates :description, :presence => true
	validates :image_url, :presence => true
	validates :price, :presence => true
	validates_format_of :price, :with => /^\d+\.*\d{0,2}$/
end
