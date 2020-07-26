# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rail s db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"admin@abc.com", password: "pass123", password_confirmation: "pass123", role: 0, admin: true)
puts "Admin: admin@abc.com, password: pass123"

FoodCategory.create([{name: "North Indian"}, {name: "South Indian"}, {name: "Thai"}])
puts "Food Category Created"

store_one = FoodCategory.first.food_stores.create(name: "The Real Dhaba")
store_two = FoodCategory.second.food_stores.create(name: "Dosa Treat")
store_three = FoodCategory.third.food_stores.create(name: "Thai Point")
puts "Food Store Created"

Company.create([{name: "StartTrek LLC."}, {name: "Timber Corp."}, {name: "NovoPlay"}])
puts "Company Created"

chef_one = User.create(email:"chef1@abc.com", password: "pass123", password_confirmation: "pass123", role: 2)
ChefProfile.create(name: "Timothy Sen", phone: "8754219865", user_id: chef_one.id, food_store_id: store_one.id, approved: true)
puts "Frist_Chef: chef1@abc.com:pass123"

chef_two = User.create(email:"chef2@abc.com", password: "pass123", password_confirmation: "pass123", role: 2)
ChefProfile.create(name: "Ramashankar Singh", phone: "8754212154", user_id: chef_two.id, food_store_id: store_two.id, approved: true)
puts "SeconChef: chef2@abc.com:pass123"

chef_three = User.create(email:"chef3@abc.com", password: "pass123", password_confirmation: "pass123", role: 2)
ChefProfile.create(name: "Chandra Sekhar", phone: "8754216578", user_id: chef_three.id, food_store_id: store_three.id, approved: true)
puts "ThirdChef: chef3@abc.com:pass123"

200.times do
  Faker::UniqueGenerator.clear
  store_one.food_items.create(    
    name: Faker::Food.unique.dish,
    description: Faker::Food.unique.description,
    price: rand(100..2000)
  )

  store_two.food_items.create(    
    name: Faker::Food.unique.dish,
    description: Faker::Food.unique.description,
    price: rand(100..2000)
  )

  store_three.food_items.create(    
    name: Faker::Food.unique.dish,
    description: Faker::Food.unique.description,
    price: rand(100..2000)
  )
end

puts "Database seeded"
