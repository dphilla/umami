require 'rails_helper'

RSpec.feature "user can't add retired item" do
  scenario "when the item's status is retired" do
    item = create(:item, status: 1)

    visit item_path(item)

    expect(page).to_not have_content("Add to Cart")
    expect(page).to have_content("Retired")
  end
end
