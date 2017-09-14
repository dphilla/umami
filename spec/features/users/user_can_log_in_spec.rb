require 'rails_helper'

RSpec.feature "user can log in" do
  scenario "with correct credentials" do
    user = create(:user)

    visit root_path

    expect(page).to have_content("Login")

    click_on("Login")

    expect(current_path).to eq("/login")

    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: "Password"

    click_on("Log in")

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as #{user.name}")

    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end

  scenario "with incorrect password" do
    user = create(:user)

    visit root_path

    expect(page).to have_content("Login")

    click_on("Login")

    expect(current_path).to eq("/login")

    fill_in "user[name]", with: user.name
    fill_in "user[password]", with: "WrongPassword"

    click_on("Log in")

    expect(current_path).to eq("/login")
    expect(page).to have_content("Incorrect Password for #{user.name}")
  end

  scenario "with incorrect username" do
    user = create(:user)

    visit root_path

    expect(page).to have_content("Login")

    click_on("Login")

    expect(current_path).to eq("/login")

    fill_in "user[name]", with: "Jo Shmo"
    fill_in "user[password]", with: "Password"

    click_on("Log in")

    expect(current_path).to eq("/login")
    expect(page).to have_content("Username Jo Shmo not Registered")
  end
end
