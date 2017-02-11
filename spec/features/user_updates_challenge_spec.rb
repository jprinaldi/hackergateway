require 'rails_helper'

RSpec.feature 'User updates challenge', type: :feature do
  scenario 'with admin role' do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    challenge = FactoryGirl.create(:challenge)
    new_challenge_name = 'ch4ll3ng3'
    login_as(user)
    visit rails_admin.edit_path(model_name: 'challenge', id: challenge.id)
    fill_in 'Name', with: new_challenge_name
    click_button 'Save'
    expect(page).to have_current_path(
      rails_admin.index_path(model_name: 'challenge')
    )
    expect(page).to have_content(new_challenge_name)
    expect(page).not_to have_content(challenge.name)
  end

  scenario 'without admin role' do
    user = FactoryGirl.create(:user, :confirmed)
    challenge = FactoryGirl.create(:challenge)
    login_as(user)
    visit rails_admin.edit_path(model_name: 'challenge', id: challenge.id)
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('You are not authorized to access this page')
  end

  scenario 'without signing in' do
    challenge = FactoryGirl.create(:challenge)
    visit rails_admin.edit_path(model_name: 'challenge', id: challenge.id)
    expect(page).to have_current_path(new_user_session_path)
  end
end
