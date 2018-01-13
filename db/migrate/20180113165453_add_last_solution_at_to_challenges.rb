# frozen_string_literal: true

class AddLastSolutionAtToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :last_solution_at, :datetime
  end
end
