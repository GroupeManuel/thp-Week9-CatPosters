class Mailing

	def initialize
		@gibbon = Gibbon::Request.new
	end
	
	# Coordonner avec le form sign up
	def new_subscriber(email)
		@gibbon.lists("c3c516a4aa").members.create(
		body: {email_address: email, status: "subscribed"}
		)
	end

	def send_automated_mail
		@gibbon.automations("1f66cb8bb3").actions.startallemails
	end

	def retrieve
		@gibbon.lists("c3c516a4aa").members
	end

	def retrieve2
		@gibbon.automations.retrieve
	end


end
