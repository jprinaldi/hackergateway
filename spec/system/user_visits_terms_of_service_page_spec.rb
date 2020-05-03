# frozen_string_literal: true

RSpec.describe "User visits terms of service page", type: :system do
  it "successfully" do
    visit policies_terms_path
    expect(page)
      .to have_current_path(policies_terms_path)
      .and have_content("Terms of Service")
  end
end
