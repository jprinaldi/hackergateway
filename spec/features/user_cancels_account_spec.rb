# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User cancels account", type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user, :confirmed)
    login_as(@user)
  end

  scenario "successfully" do
    visit edit_user_registration_path
    click_link "Cancel my account"
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Your account has been successfully cancelled")
  end
end
