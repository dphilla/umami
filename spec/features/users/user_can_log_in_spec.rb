As a registered user When I visit “/” Then I should see a link for “Login” And
when I click “Login” And I should be on the “/login” page And I should see a place
to insert my credentials to login And I fill in my desired credentials And I submit
my information Then my current page should be “/dashboard” And I should see a message
in the navbar that says “Logged in as SOME_USER” And I should see my profile information
And I should not see a link for “Login” And I should see a link for “Logout”

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

  end
end
