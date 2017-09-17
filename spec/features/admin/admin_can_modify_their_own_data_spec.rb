require 'rails_helper'

feature 'Admin' do
  scenario 'can edit their own information' do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    
  end
end