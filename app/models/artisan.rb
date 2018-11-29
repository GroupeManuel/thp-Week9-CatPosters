class Artisan < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable
	has_many :orders
	has_one :cart
	# validates :first_name, :presence => true
	# validates :last_name, :presence => true
	validates :email, :presence => true, :uniqueness => true
	validates_format_of :email,:with => Devise::email_regexp
	validates :password, :presence => true, :length => { :minimum => 6, :message => "please, use minimum 6 characters" }

	# Following lines enable to send a welcome email to any new subscriber 
	after_create_commit	:send_welcome_mail
	def send_welcome_mail
    	new_email = Artisan.last.email
	    Mailing.new.new_subscriber(new_email)
    	# EmailSender.send_welcome_mail(email: email)
	end

end
