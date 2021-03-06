10.times do
   User.create!(
       email: Faker::Name.first_name + '@example.com',
       password: Faker::Overwatch.hero + Faker::Number.hexadecimal(3)
       ) 
end

users = User.all

20.times do
   Wiki.create!(
       title: Faker::FamilyGuy.quote,
       body: Faker::RickAndMorty.quote + Faker::RickAndMorty.quote,
       private: false,
       user_id: users.sample.id
       ) 
end

standard = User.create!(
  email:    'standard@example.com',
  password: 'helloworld'
)

premium = User.create!(
  email:    'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)

admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
