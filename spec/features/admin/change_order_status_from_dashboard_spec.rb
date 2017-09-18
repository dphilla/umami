require 'rails_helper'

feature "As an admin user" do
  context "when I visit admin dashboard" do
    scenario "I can change an order status" do
      admin = create(:user, role: 1)
      user = create(:user)
      user2 = create(:user)
      order1, order2 = create_list(:order, 2, user: user)
      order3 = create(:order, user: user2, status: "paid")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      
      click_on('cancel order', match: :first)
      
      expect(page).to_not have_content(order1)
      expect(page).to have_content(user.name)
    end
  end
end
