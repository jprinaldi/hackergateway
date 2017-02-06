require 'rails_helper'

RSpec.feature "User creates challenge", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(user)
    challenge = FactoryGirl.build(:challenge)
    category = FactoryGirl.create(:category)
    visit rails_admin.new_path(model_name: 'challenge')
    fill_in 'Name', with: challenge.name
    fill_in 'Body', with: challenge.body
    fill_in 'Answer', with: challenge.answer
    select challenge.category.name, from: 'Category'
    click_button 'Save'
    expect(page).to have_current_path(rails_admin.index_path(model_name: 'challenge'))
    expect(page).to have_content(challenge.name)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    expect {
      visit rails_admin.new_path(model_name: 'challenge')
    }.to raise_error(CanCan::AccessDenied)
  end

  scenario "without signing in" do
    visit rails_admin.new_path(model_name: 'challenge')
    expect(page).to have_current_path(new_user_session_path)
  end
end
