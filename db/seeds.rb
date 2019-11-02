100.times do
	User.create(email: Faker::Internet.email)
end