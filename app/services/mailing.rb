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
		member_id = @gibbon.lists("c3c516a4aa").segments("11385").members(body: {email_address: email}).retrieve
		@gibbon.lists("c3c516a4aa").segments("11385").members(member_id).create
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

#useful info 
# https://github.com/amro/gibbon
# https://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/
# https://developer.mailchimp.com/documentation/mailchimp/guides/how-to-use-tags/
# @body={:members=>[{:id=>"506e38eec85b63d51c4d69ca3f739efa", :email_address=>"manueltrinquet@gmail.com", :unique_email_id=>"b6e7bb97a6"
# Gibbon::Request.new.lists("c3c516a4aa").members("506e38eec85b63d51c4d69ca3f739efa").update(body: {segments: {"11385": true}})	
