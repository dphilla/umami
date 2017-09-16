require 'rails_helper'

feature 'User' do
  context 'as registered admin' do
    scenario 'can see admin dashboard' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      
      visit admin_dashboard_path
      
      expect(page).to have_content('Admin Dashboard')
    end
  end
  
  context 'as a regular user' do
    scenario "can't see admin dashboard" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit admin_dashboard_path

      expect(page).to_not have_content('Admin Dashboard')
    end
  end
end