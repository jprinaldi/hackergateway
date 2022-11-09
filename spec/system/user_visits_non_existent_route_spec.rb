# frozen_string_literal: true

RSpec.describe "User visits non-existent route" do
  subject { page }

  non_existent_route = "/non-existent-route"

  before { visit non_existent_route }

  it { is_expected.to have_current_path(non_existent_route) }

  it { is_expected.to have_content("Not Found") }
end
