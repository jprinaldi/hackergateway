# frozen_string_literal: true

RSpec.describe "User visits policies page", type: :system do
  subject { page }

  before { visit policies_path }

  it { is_expected.to have_current_path(policies_path) }

  it { is_expected.to have_content("Privacy Policy") }

  it { is_expected.to have_content("Terms of Service") }
end
