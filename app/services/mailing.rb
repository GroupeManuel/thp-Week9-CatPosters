class Mailing

	def initialize
		@gibbon = Gibbon::Request.new
	end
	
	# Coordonné avec le model Artisan, une fois qu'un artisan est créé
	def new_subscriber(email)
		@gibbon.lists("c3c516a4aa").members.create(
		body: {email_address: email, status: "subscribed"}
		)
	end

	# Coordonné par le controller order, une fois qu'un order est créé
	def new_buyer(email)
		@gibbon.lists("c3c516a4aa").segments("11385").members.create(body: {email_address: email})
		@gibbon.lists("c3c516a4aa").segments("11385").members.create(body: {email_address: "manueltrinquet@gmail.com"})
		puts "fuck gibbon"
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
# member_id = @gibbon.lists("c3c516a4aa").segments("11385").members(body: {email_address: email}).retrieve
		# @gibbon.lists("c3c516a4aa").members("506e38eec85b63d51c4d69ca3f739efa").tags.create(body: {tag_name: "Order", status: "active"})

