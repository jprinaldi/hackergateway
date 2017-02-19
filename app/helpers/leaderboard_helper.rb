module LeaderboardHelper # :nodoc:
  def leaderboard_rank(index, page, per)
    (index + 1) + ((page || 1).to_i - 1) * per.to_i
  end
end
