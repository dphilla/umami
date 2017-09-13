require 'rails_helper'

RSpec.feature "user can create new account" do
  scenario "with correct information" do
    user = build(:user)

    visit root_path
    click_on("Login")

    expect(page).to have_content("Create Account")

    click_on("Create Account")

    fill_in "user[name]", with: user.name
    fill_in "user[address]", with: user.address
    fill_in "user[password]", with: user.password
    fill_in "user[password_check]", with: user.password_check
    click_on("Create Account")

    expect(current_user).to be_truthy
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.name}")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end
end
