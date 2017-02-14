require "rails_helper"

RSpec.feature "User visits policies page", type: :feature do
  scenario "successfully" do
    visit policies_path
    expect(page)
      .to have_current_path(policies_path)
      .and have_content("Privacy Policy")
      .and have_content("Terms of Service")
  end
end
