# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rail s db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"admin@abc.com", password: "admin123@@", password_confirmation: "admin123@@", role: 0, admin: true)
FoodCategory.create([{name: "North Indian"}, {name: "South Indian"}, {name: "Thai"}])
FoodCategory.first.food_stores.build(name: "The Real Dhaba").save
FoodCategory.second.food_stores.build(name: "Dosa Treat").save
FoodCategory.third.food_stores.build(name: "Thai Point").save
Company.create([{name: "StartTrek LLC."}, {name: "Timber Corp."}, {name: "NovoPlay"}])