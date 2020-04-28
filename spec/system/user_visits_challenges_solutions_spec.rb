# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User checks challenge's solutions", type: :system do
  let(:solution) { FactoryBot.create(:solution) }

  before do
    visit challenge_solutions_path(solution.challenge)
  end

  it "works" do
    expect(page)
      .to have_current_path(challenge_solutions_path(solution.challenge))
      .and have_content(solution.user.username)
      .and have_content(solution.challenge.name)
  end
end
