require 'rails_helper'

RSpec.feature "user can see all orders" do
  scenario "from orders path" do

    user = create(:user)
    user2 = create(:user)
    order1, order2 = create_list(:order, 2, user: user)
    order3 = create(:order, user: user2)

    visit("/orders")

    expect(page).to have_content(order1)
    expect(page).to have_content(order2)
    expect(page).to_not have_content(order3)
  end
end
