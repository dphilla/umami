require 'rails_helper'

RSpec.feature "user can log out" do
  scenario "after logging in" do
    user = create(:user)

    visit root_path
    click_on("Login")
    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: "Password"
    click_on("Log in")

    click_on("Logout")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
