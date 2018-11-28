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

	def new_buyer(email)
#		@gibbon.lists("c3c516a4aa").segments("xx").members(body: {email_address: email})

	end

	def send_automated_mail
		@gibbon.automations("xxx").actions.startallemails
	end

# Use to know your list_id or automation_id or any id
	def retrieve
		@gibbon.lists("c3c516a4aa").members.retrieve
	end

	def retrieve2
		@gibbon.automations.retrieve
	end

	def retrieve3
		@gibbon.lists("c3c516a4aa")
	end

end
