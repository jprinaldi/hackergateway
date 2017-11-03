# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User visits privacy policy page", type: :feature do
  scenario "successfully" do
    visit policies_privacy_path
    expect(page)
      .to have_current_path(policies_privacy_path)
      .and have_content("Privacy Policy")
  end
end
