# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

User.create :email => "user1@example.com", :password => "user123"
User.create :email => "user2@example.com", :password => "user123", :admin => true
OrderItem.create quantity: 3, special_product_id: 1, inventory_product_id: 1, order_id: 1
Order.create order_status_id: 1, user_id: 1
