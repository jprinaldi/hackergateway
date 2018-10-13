# frozen_string_literal: true

after "shared:users", "shared:challenges" do
  users = User.all
  challenges = Challenge.all
  users.each_with_index do |user, user_index|
    next unless user_index.even?

    challenges.each_with_index do |challenge, challenge_index|
      user.solve(challenge) if challenge_index.odd?
    end
  end
end
