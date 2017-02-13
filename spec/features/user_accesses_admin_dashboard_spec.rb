require "rails_helper"

RSpec.feature "User accesses admin dashboard", type: :feature do
  scenario "with admin role" do
    user = FactoryGirl.create(:user, :confirmed, :admin)
    login_as(user)
    visit rails_admin.dashboard_path
    expect(page).to have_current_path(rails_admin.dashboard_path)
  end

  scenario "without admin role" do
    user = FactoryGirl.create(:user, :confirmed)
    login_as(user)
    visit rails_admin.dashboard_path
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("You are not authorized to access this page")
  end

  scenario "without signing in" do
    visit rails_admin.dashboard_path
    expect(page).to have_current_path(new_user_session_path)
    expect(page)
      .to have_content("You need to sign in or sign up before continuing")
  end
end
