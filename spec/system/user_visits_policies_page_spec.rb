# frozen_string_literal: true

RSpec.describe "User visits policies page", type: :system do
  it "successfully" do
    visit policies_path
    expect(page)
      .to have_current_path(policies_path)
      .and have_content("Privacy Policy")
      .and have_content("Terms of Service")
  end
end
