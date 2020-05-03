# frozen_string_literal: true

RSpec.describe "User visits privacy policy page", type: :system do
  it "successfully" do
    visit policies_privacy_path
    expect(page)
      .to have_current_path(policies_privacy_path)
      .and have_content("Privacy Policy")
  end
end
