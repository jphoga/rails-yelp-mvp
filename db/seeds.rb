# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'

CAT_LIST = %w{chinese italian japanese french belgian}
ADDRESS = %w{Dusseldorf Tokyo Milano Oslo NewYork}

Restaurant.destroy_all if Rails.env.development?
Review.destroy_all if Rails.env.development?

puts "Create 10 fake restaurants and reviews"
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: ADDRESS.sample(1).join(""),
    phone_number: "12345678++",
    category: CAT_LIST.sample(1).join("")
    )
    restaurant.save!
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: restaurant
      )
    review.save!
end
puts "Finished!"


