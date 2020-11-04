# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,# all options available below
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
  rand(0..10).times do
    Review.create do |review|
      review.restaurant = restaurant
      review.content = Faker::Lorem.paragraph # all options available below
      review.rating = rand(0..5).to_i
    end
  end
end

# 10.times do
#   Review.create do |review|
#     review.restaurant_id = 18
#     review.content = Faker::Lorem.paragraph # all options available below
#     review.rating = rand(0..5).to_i
#   end
# end
