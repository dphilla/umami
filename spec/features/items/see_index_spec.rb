require 'rails_helper'


feature "As an unathenticated user" do
  scenario "sees all items" do

  Item.create(name: "Tablesalt", descrption: "its good", price: 1, stock_level: 1000, image: "google.com")
  Item.create(name: "Tablesalt", descrption: "its good", price: 1, stock_level: 1000, image: "google.com")
  Item.create(name: "Tablesalt", descrption: "its good", price: 1, stock_level: 1000, image: "google.com")

  visit items_path

  expect(page).to have_content(Item.first.name)

  end
end

