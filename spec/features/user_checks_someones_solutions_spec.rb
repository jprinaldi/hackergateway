require "rails_helper"

RSpec.feature "User checks someone's solutions", type: :feature do
  scenario "successfully" do
    solution = FactoryBot.create(:solution)
    visit user_solutions_path(solution.user)
    expect(page)
      .to have_current_path(user_solutions_path(solution.user))
      .and have_content(solution.user.username)
      .and have_content(solution.challenge.name)
  end
end
