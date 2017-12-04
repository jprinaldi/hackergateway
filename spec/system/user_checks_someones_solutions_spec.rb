# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User checks someone's solutions", type: :system do
  scenario "successfully" do
    solution = FactoryBot.create(:solution)
    visit user_solutions_path(solution.user)
    expect(page)
      .to have_current_path(user_solutions_path(solution.user))
      .and have_content(solution.user.username)
      .and have_content(solution.challenge.name)
  end
end
