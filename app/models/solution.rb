# frozen_string_literal: true

class Solution < ApplicationRecord # :nodoc:
  belongs_to :user, counter_cache: true
  belongs_to :challenge, counter_cache: true

  validates :user, uniqueness: {
    scope: :challenge, message: I18n.t("challenges.already_solved")
  }

  after_create do
    user.update(last_solution_at: created_at)
    challenge.update(last_solution_at: created_at)
  end

  after_destroy do
    user.update(last_solution_at: user.solutions.last&.created_at)
    challenge.update(
      last_solution_at: challenge.solutions.last&.created_at
    )
  end
end
