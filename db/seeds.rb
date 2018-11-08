
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing all existing users"
User.destroy_all if Rails.env == "DEVELOPMENT"

puts "Creating 50 users"

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

puts "#{User.count} users created"

puts "Clearing all existing bikes"
Bike.destroy_all if Rails.env == "DEVELOPMENT"

puts "creating 100 new bikes"
100.times do |bike|
  bike = Bike.new(
    category: Faker::Vehicle.drive_type, #for category
    price: [5,10,15,25].sample, #for price
    brand: Faker::Vehicle.make, #for brand
    engine_size: [50,100,150,250].sample, #for engine_size
    user: User.all.sample
  )
  bike.save
end
puts "Created 100 bikes"

puts "SuccSeeded!!"


