require 'rails_helper'

RSpec.feature "user can see items by category" do
  scenario "from main page" do
    tag1, tag2 = create_list(:tag, 2)
    item1, item2, item3 = create_list(:item, 3)
    item_tag1 = create(:item_tag, tag: tag1, item: item1)
    item_tag2 = create(:item_tag, tag: tag1, item: item2)
    item_tag3 = create(:item_tag, tag: tag2, item: item2)
    item_tag4 = create(:item_tag, tag: tag2, item: item3)

    visit("/#{tag1.name}")

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item2.name)
    expect(page).to_not have_content(item3.name)

    visit("/#{tag2.name}")

    expect(page).to have_content(item2.name)
    expect(page).to have_content(item3.name)
    expect(page).to_not have_content(item1.name)
  end
end
