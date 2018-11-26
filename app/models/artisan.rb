class Artisan < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable
	has_many :orders
	has_one :cart
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :presence => true, :uniqueness => true
	validates_format_of :email,:with => Devise::email_regexp
	validates :password, :presence => true, :length => { :minimum => 6, :message => "please, use minimum 6 characters" }
end
