# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
	Artisan.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8), activity_type: Faker::Job.field, company_address: Faker::Address.full_address) 
end

20.times do 
	Item.create!(title: Faker::Science.element, description: Faker::Lorem.sentence, image_url: "photos_sac_cafe_#{rand(1..16)}.jpg", price: rand(1..100))
end

10.times do 
	Cart.create!(status: Faker::Lorem.word, artisan_id: rand(Artisan.first.id..Artisan.last.id))
end

5.times do
	CartItem.create!(quantity: rand(1..10), item_id: rand(Item.first.id..Item.last.id), cart_id: rand(Cart.first.id..Cart.last.id), price: rand(1..100))
end

