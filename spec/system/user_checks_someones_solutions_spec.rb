# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User checks someone's solutions", type: :system do
  subject { page }

  let(:solution) { FactoryBot.create(:solution) }

  before do
    visit user_solutions_path(solution.user)
  end

  it { is_expected.to have_current_path(user_solutions_path(solution.user)) }

  it { is_expected.to have_content(solution.user.username) }

  it { is_expected.to have_content(solution.challenge.name) }
end
