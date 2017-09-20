require 'rails_helper'

RSpec.feature "user can see all orders" do
  scenario "from orders path" do
    user = create(:user)
    visit root_path
    click_on("Login")
    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: "Password"
    click_on("Log in")

    user2 = create(:user)
    order1, order2 = create_list(:order, 2, user: user)
    order3 = create(:order, user: user2)

    click_on("Orders", match: :first)

    expect(page).to have_content(order1.created_at.strftime('%a %b %e %Y %H:%M'))
    expect(page).to have_content(order2.created_at.strftime('%a %b %e %Y %H:%M'))
    expect(page).to_not have_content(order3)
  end

  scenario "when not logged in" do
    user2 = create(:user)

    visit root_path

    expect(page).to_not have_content("Orders")

    visit("/orders")

    expect(current_path).to eq(login_path)
  end
end
