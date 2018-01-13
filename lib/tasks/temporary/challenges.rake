# frozen_string_literal: true

namespace :challenges do
  desc "Set initial last_solution_at column for challenges"
  task update_last_solution_at: :environment do
    challenges = Challenge
                 .where("last_solution_at IS NULL AND solutions_count > 0")
    puts "Going to update #{challenges.count} challenges."

    ActiveRecord::Base.transaction do
      challenges.each do |challenge|
        last_solution = challenge.solutions.last
        # rubocop:disable Rails/SkipsModelValidations
        challenge.update_columns(last_solution_at: last_solution.created_at)
        # rubocop:enable Rails/SkipsModelValidations
        print "."
      end
    end

    puts " All done!"
  end
end
