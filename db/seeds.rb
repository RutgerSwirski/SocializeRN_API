100.times do
	User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraphs)
end
# 	Invite.create(sender: User.find(rand(2..90)), reciever: User.find(102), status: 'pending')