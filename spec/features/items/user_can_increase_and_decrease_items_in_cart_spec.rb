require 'rails_helper'

feature "User adds items to cart" do
  context "and visits cart path" do
    scenario "and increases the quantity" do
      item1 = create(:item)
      visit items_path
      times2 = Money.new((item1.price * 2), "USD")

      click_on("add_shopping_cart")

      click_on("shopping_cart")

      expect(page).to have_content(item1.name)
      expect(page).to have_content(Money.new(item1.price, "USD"))
      expect(page).to_not have_content(times2)
      expect(page).to have_content("1")
      # expect(page).to_not have_content("2")
      expect(find('tr', text: 'Item Price')).to_not have_content('2')

      click_on("add")
      expect(page).to have_content(times2)
      expect(page).to have_content("2")
    end
    scenario "and decreases the quantity" do
      item1 = create(:item)
      visit items_path
      times2 = Money.new((item1.price * 2), "USD")

      click_on("add_shopping_cart")

      click_on("shopping_cart")

      expect(page).to have_content(item1.name)
      expect(page).to have_content(Money.new(item1.price, "USD"))
      expect(page).to_not have_content(times2)
      expect(page).to have_content("1")
      # expect(page).to_not have_content("2")
      expect(find('tr', text: 'Item Price')).to_not have_content('2')

      click_on("add")
      expect(page).to have_content(times2)
      expect(page).to have_content("2")

      click_on("remove")
      expect(page).to_not have_content(times2)
      expect(page).to have_content("1")
      expect(page).to have_content(item1.name)

      click_on("remove")
      expect(page).to_not have_content("1")
      expect(page).to_not have_content(item1.name)
    end
  end
end


# Story 7:
#
# Background: My cart has an item in it
#
# As a visitor When I visit “/cart” Then I should see my item with a quantity of 1 When I decrease the quantity Then my current page should be ‘/cart’ And that item’s quantity should reflect the decrease And the subtotal for that item should decrease And the total for the cart should match that decrease
