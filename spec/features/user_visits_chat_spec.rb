require "rails_helper"

RSpec.feature "User visits chat", type: :feature do
  scenario "successfully" do
    visit chat_path
    expect(page).to have_current_path(chat_path)
  end
end
