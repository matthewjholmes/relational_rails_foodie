# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Dish.destroy_all
FarmersMarket.destroy_all
Produce.destroy_all

restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
restaurant2 = Restaurant.create(name: "Rails", dine_in: false, rating: 1)
restaurant3 = Restaurant.create(name: "SQooL", dine_in: true, rating: 3)

dish1 = Dish.create(name: 'Soup', seasonal: true, calories: 450, restaurant_id: restaurant1.id)
dish2 = Dish.create(name: 'Salad', seasonal: true, calories: 300, restaurant_id: restaurant1.id)
dish3 = Dish.create(name: 'Sandwich', seasonal: false, calories: 950, restaurant_id: restaurant1.id)
dish4 = Dish.create(name: 'Rolls', seasonal: false, calories: 400, restaurant_id: restaurant2.id)
dish5 = Dish.create(name: 'Pizza', seasonal: false, calories: 1150, restaurant_id: restaurant2.id)
dish6 = Dish.create(name: 'Pasta', seasonal: false, calories: 1200, restaurant_id: restaurant2.id)
dish7 = Dish.create(name: 'Fried Rice', seasonal: false, calories: 200, restaurant_id: restaurant3.id)
dish8 = Dish.create(name: 'Stir Fry', seasonal: false, calories: 850, restaurant_id: restaurant3.id)
dish9 = Dish.create(name: 'Dumpling', seasonal: false, calories: 900, restaurant_id: restaurant3.id
dish10 = Dish.create(name: 'Pho', seasonal: true, calories: 1200, restaurant_id: restaurant3.id)
dish11 = Dish.create(name: 'Ravioli', seasonal: true, calories: 2200, restaurant_id: restaurant2.id)
dish12 = Dish.create(name: 'Pita', seasonal: true, calories: 800, restaurant_id: restaurant1.id)
dish13 = Dish.create(name: 'Wrap', seasonal: true, calories: 800, restaurant_id: restaurant1.id)
dish14 = Dish.create(name: 'Garlic Knots', seasonal: true, calories: 900, restaurant_id: restaurant2.id)
dish15 = Dish.create(name: 'Spring Rolls', seasonal: true, calories: 900, restaurant_id: restaurant2.id)

farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
farmers_market2 = FarmersMarket.create(name: "Megan's Market", local: false , vendor_count: 20)
farmers_market3 = FarmersMarket.create(name: "Dao Grain", local: true , vendor_count: 1)

produce1 = Produce.create(name: "Onions", seasonal: true, quantity: 160, farmers_market_id: farmers_market1.id)
produce2 = Produce.create(name: "Mushrooms", seasonal: true, quantity: 180, farmers_market_id: farmers_market1.id)
produce3 = Produce.create(name: "Peppers", seasonal: false, quantity: 200, farmers_market_id: farmers_market1.id)
produce4 = Produce.create(name: "Apples", seasonal: false, quantity: 450, farmers_market_id: farmers_market2.id)
produce5 = Produce.create(name: "Peaches", seasonal: true, quantity: 600, farmers_market_id: farmers_market2.id)
produce6 = Produce.create(name: "Bananas", seasonal: false, quantity: 300, farmers_market_id: farmers_market2.id)
produce7 = Produce.create(name: "Rice", seasonal: true, quantity: 1300, farmers_market_id: farmers_market3.id)
produce8 = Produce.create(name: "Black Beans", seasonal: false, quantity: 700, farmers_market_id: farmers_market3.id)
produce9 = Produce.create(name: "Lentils", seasonal: true, quantity: 400, farmers_market_id: farmers_market3.id)
produce10 = Produce.create(name: "Chick Peas", seasonal: true, quantity: 400, farmers_market_id: farmers_market3.id)
produce11 = Produce.create(name: "Pinto Beans", seasonal: true, quantity: 400, farmers_market_id: farmers_market3.id)
produce12 = Produce.create(name: "Squash", seasonal: true, quantity: 400, farmers_market_id: farmers_market1.id)
produce13 = Produce.create(name: "Celery", seasonal: true, quantity: 400, farmers_market_id: farmers_market1.id)
produce14 = Produce.create(name: "Coconut", seasonal: true, quantity: 400, farmers_market_id: farmers_market2.id)
produce15 = Produce.create(name: "Guava", seasonal: true, quantity: 400, farmers_market_id: farmers_market2.id)

