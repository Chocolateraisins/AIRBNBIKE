
50.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: Faker::PhoneNumber.phone_number,
  picture: "https://loremflickr.com/g/320/240/portrait/all"
  )
end

puts "seed done"
puts "#{User.count} users created"
