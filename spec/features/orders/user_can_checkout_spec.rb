# Background: An existing user and a cart with items
#
# As a visitor When I add items to my cart And I visit “/cart” And I click “Login or Register to Checkout” Then I should be required to login
#
# When I am logged in And I visit my cart And when I click “Checkout” Then the order should be placed And my current page should be “/orders” And I should see a message “Order was successfully placed” And I should see the order I just placed in a table
require 'rails_helper'

# feature "User" do
#   context "not logged in " do
#     scenario "needs to login or register to checkout" do
#       expect(page).to have_content()
#       
#     end
#   end
# end