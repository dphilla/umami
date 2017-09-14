feature "Visitor adds items to cart" do
  context "clicks on remove item" do
    scenario "item is removed from cart" do
      item1 = create(:item)

      visit items_path

      first(:link, "Add to Cart").click

      click_on("shopping_cart")

      expect(page).to have_content(item1.price)

      click_on("Remove")

      expect(page).to_not have_content(item1.price)
    end
  end
end
