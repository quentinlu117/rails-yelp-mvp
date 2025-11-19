require 'faker'

puts "destroy all restaurants"
Restaurant.destroy_all
Review.destroy_all

puts "-_-_-_ Creating some restaurants -_-_-_-_-"

12.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    category: Restaurant::CATEGORY.sample,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code
  )
end
puts "***** Creating some Reviews ****"
50.times do
   Review.create!(
    rating: rand(0..5),
    content: Faker::Restaurant.review,
    restaurant_id: Restaurant.all.sample.id
  )
end
puts ".....Finish!"
