# frozen_string_literal: true

RSpec.describe "User visits privacy policy page", type: :system do
  subject { page }

  before { visit policies_privacy_path }

  it { is_expected.to have_current_path(policies_privacy_path) }

  it { is_expected.to have_content("Privacy Policy") }
end
