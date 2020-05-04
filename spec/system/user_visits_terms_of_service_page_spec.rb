# frozen_string_literal: true

RSpec.describe "User visits terms of service page", type: :system do
  subject { page }

  before { visit policies_terms_path }

  it { is_expected.to have_current_path(policies_terms_path) }

  it { is_expected.to have_content("Terms of Service") }
end
