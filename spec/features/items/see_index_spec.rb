require 'rails_helper'


feature "As an unathenticated user" do
  scenario "sees all items" do

  3.times do
    item(:create)
  end

  visit items_path

  expect(page).to have_content(Item.first.name)

  end
end

