10.times do 
	User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: "password", location: Faker::Address.city)
end

users = User.all

10.times do 
	cs = CoffeeShop.new(name: Faker::Team.name, city: Faker::Address.city, state: Faker::Address.state_abbr, street_address: Faker::Address.street_address, website: Faker::Internet.url, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
	cs.likers << users.sample
	cs.save
end