require 'rails_helper'

RSpec.feature "User updates category", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    category = FactoryGirl.create(:category)
    new_category_name = "c4t3g0ry"
    login_as(user)
    visit rails_admin.edit_path(model_name: 'category', id: category.id)
    fill_in 'Name', with: new_category_name
    click_button 'Save'
    expect(page).to have_current_path(rails_admin.index_path(model_name: 'category'))
    expect(page).to have_content(new_category_name)
    expect(page).not_to have_content(category.name)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    category = FactoryGirl.create(:category)
    login_as(user)
    visit rails_admin.edit_path(model_name: 'category', id: category.id)
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("You are not authorized to access this page")
  end

  scenario "without signing in" do
    category = FactoryGirl.create(:category)
    visit rails_admin.edit_path(model_name: 'category', id: category.id)
    expect(page).to have_current_path(new_user_session_path)
  end
end
