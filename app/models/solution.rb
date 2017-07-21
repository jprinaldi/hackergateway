class Solution < ApplicationRecord # :nodoc:
  belongs_to :user, counter_cache: true
  belongs_to :challenge, counter_cache: true
  resourcify

  validates :user, presence: :true
  validates :challenge, presence: :true
  validates :user, uniqueness: {
    scope: :challenge, message: "has already solved this challenge"
  }

  after_destroy do |solution|
    new_solution = user.solutions.second_to_last
    solution.user.update_attributes(
      last_solution_at:
      new_solution ? new_solution.created_at : nil
    )
  end
end
