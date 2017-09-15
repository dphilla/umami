require 'rails_helper'

RSpec.feature "user can view single order" do
  scenario "from orders page" do
    user = create(:user)
    visit root_path
    click_on("Login")
    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: "Password"
    click_on("Log in")
    order = create(:order, user: user)
    item = create(:item)
    order_item = create(:order_item, order: order, item: item)

    visit orders_path
    click_on order.created_at

    expect(current_path).to eq(order_path(order))
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.to_money)
    expect(page).to have_content(order.status)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.total_price)
  end
end
