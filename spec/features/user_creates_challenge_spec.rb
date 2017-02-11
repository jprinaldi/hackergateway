require 'rails_helper'

RSpec.feature 'User creates challenge', type: :feature do
  scenario 'with admin role' do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(user)
    challenge = FactoryGirl.build(:challenge)
    visit rails_admin.new_path(model_name: 'challenge')
    fill_in 'Name', with: challenge.name
    fill_in 'Body', with: challenge.body
    fill_in 'Answer', with: challenge.answer
    select challenge.category.name, from: 'Category'
    click_button 'Save'
    expect(page).to have_current_path(
      rails_admin.index_path(model_name: 'challenge')
    )
    expect(page).to have_content(challenge.name)
  end

  scenario 'without admin role' do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    visit rails_admin.new_path(model_name: 'challenge')
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('You are not authorized to access this page')
  end

  scenario 'without signing in' do
    visit rails_admin.new_path(model_name: 'challenge')
    expect(page).to have_current_path(new_user_session_path)
  end
end
