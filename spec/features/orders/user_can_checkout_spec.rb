# Background: An existing user and a cart with items
#
# As a visitor When I add items to my cart And I visit “/cart” And I click “Login or Register to Checkout” Then I should be required to login
#
# When I am logged in And I visit my cart And when I click “Checkout” Then the order should be placed And my current page should be “/orders” And I should see a message “Order was successfully placed” And I should see the order I just placed in a table
require 'rails_helper'

feature "User" do
  context "not logged in " do
    scenario "needs to login or register to checkout" do
      visit cart_path
      
      expect(page).to have_content('Login or Create Account to Checkout')
    end
    
    context 'logged in' do
      scenario 'sees checkout button' do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        visit cart_path
        
        expect(page).to_not have_content('Login or Create Account to Checkout')
        expect(page).to have_content('Checkout')
      end
    end
  end
end