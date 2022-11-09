# frozen_string_literal: true

RSpec.describe "User visits non-existent user's profile" do
  subject { page }

  non_existent_user_name = "non-existent-user-name"

  before { visit user_path(non_existent_user_name) }

  it { is_expected.to have_current_path(user_path(non_existent_user_name)) }

  it { is_expected.to have_content("Not Found") }
end
