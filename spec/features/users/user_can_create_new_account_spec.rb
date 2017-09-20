require 'rails_helper'

RSpec.feature "user can create new account" do
  scenario "with correct information" do
    user = build(:user)

    visit root_path
    click_on("Login")

    expect(page).to have_content("Create Account")

    click_on("Create")

    fill_in "user[name]", with: user.name
    fill_in "user[email]", with: user.email
    fill_in "user[address]", with: user.address
    fill_in "user[password]", with: user.password
    click_on("Create")

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.name}")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end

  # scenario "with missing information" do
  #   user = build(:user)
  # 
  #   visit root_path
  #   click_on("Login")
  # 
  #   expect(page).to have_content("Create Account")
  # 
  #   click_on("Create Account")
  # 
  #   fill_in "user[email]", with: user.email
  #   fill_in "user[address]", with: user.address
  #   fill_in "user[password]", with: user.password
  #   click_on("Create")
  # 
  #   # expect(current_path).to eq(new_user_path)
  #   expect(page).to have_content("All Fields are Required")
  # end
end
