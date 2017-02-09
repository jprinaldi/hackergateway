require 'rails_helper'

RSpec.feature "User creates category", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(user)
    category = FactoryGirl.build(:category)
    visit rails_admin.new_path(model_name: 'category')
    fill_in 'Name', with: category.name
    click_button 'Save'
    expect(page)
      .to have_current_path(rails_admin.index_path(model_name: 'category'))
    expect(page)
      .to have_content(category.name)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    expect {
      visit rails_admin.new_path(model_name: 'category')
    }.to raise_error(CanCan::AccessDenied)
  end

  scenario "without signing in" do
    visit rails_admin.new_path(model_name: 'category')
    expect(page).to have_current_path(new_user_session_path)
  end
end
