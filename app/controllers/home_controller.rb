class HomeController < ApplicationController
  def index
    @newest_challenges = Challenge.last(5).reverse
    @newest_solutions = Solution.includes(:user, :challenge).last(5).reverse
    @newest_users = User.last(5).reverse
  end
end
