require "rails_helper"

RSpec.feature "User checks challenge's solutions", type: :feature do
  scenario "successfully" do
    solution = FactoryBot.create(:solution)
    visit challenge_solutions_path(solution.challenge)
    expect(page)
      .to have_current_path(challenge_solutions_path(solution.challenge))
      .and have_content(solution.user.username)
      .and have_content(solution.challenge.name)
  end
end
