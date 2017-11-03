# frozen_string_literal: true

require "rails_helper"

RSpec.feature "User visits terms of service page", type: :feature do
  scenario "successfully" do
    visit policies_terms_path
    expect(page)
      .to have_current_path(policies_terms_path)
      .and have_content("Terms of Service")
  end
end
