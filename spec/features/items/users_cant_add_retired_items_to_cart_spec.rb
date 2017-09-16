# As a user if I visit an item page and that item has been retired Then I should
# still be able to access the item page And I should not be able to add the item to their
# cart And I should see in place of the “Add to Cart” button or link - “Item Retired”
require 'rails_helper'

RSpec.feature "user can't add retired item" do
  scenario "when the item's status is retired" do
    item = create(:item, status: 1)

    visit item_path(item)

    expect(page).to_not have_content("Add to Cart")
    expect(page).to have_content("Retired")
  end
end
