# frozen_string_literal: true

RSpec.describe "User visits about page", type: :system do
  subject { page }

  before { visit about_path }

  it { is_expected.to have_current_path(about_path) }
end
