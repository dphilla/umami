# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Item.destroy_all
Tag.destroy_all

items = CSV.foreach "./db/items.csv", headers: true, header_converters: :symbol

items.each do |row|
  row = row.to_h
  row[:status] = row[:status].to_i
  Item.create!(row)
end

 Tag.create!(name: "Infused")
 Tag.create!(name: "Black")
 Tag.create!(name: "Red")
 Tag.create!(name: "Pink")
 Tag.create!(name: "Flake")
 Tag.create!(name: "Coarse")
 Tag.create!(name: "Fine")
 Tag.create!(name: "accessories")
 Tag.create!(name: "salt")
 20.times do
  Tag.create!(name: Faker::Address.unique.country)
 end

 10.times do
   User.create!(name: Faker::Name.unique.name, address: Faker::Address.street_address, email: Faker::Internet.email, password: "123")
 end

 user_collection = User.all

 10.times do
   Order.create!(user_id: user_collection.sample.id)
 end

 tag_collection = Tag.all
 item_collection = Item.all
 order_collection = Order.all

 item_collection.each do |item|
   item.tags << tag_collection.sample(rand(1..5))
 end

 order_collection.each do |order|
   order.items << item_collection.sample(rand(1..8))
 end
