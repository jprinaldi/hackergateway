# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @newest_challenges = Challenge.includes(:category).last(5).reverse
    @newest_solutions = Solution.includes(:user, :challenge).last(5).reverse
    @newest_users = User.last(5).reverse
    @top_users = User.all.order(solutions_count: :desc).first(5)
  end
end
