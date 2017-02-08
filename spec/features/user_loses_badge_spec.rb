require 'rails_helper'

RSpec.feature "User loses badge", type: :feature do
  scenario "Autobiographer" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    visit edit_user_registration_path(user)
    select 'Argentina', from: 'Country'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    visit user_path(user)
    expect(page).to have_content('Autobiographer')
    visit edit_user_registration_path(user)
    select 'Select a country', from: 'Country'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    visit user_path(user)
    expect(page).not_to have_content('Autobiographer')
  end
end
