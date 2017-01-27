class HomeController < ApplicationController
  def index
    @newest_challenges = Challenge.last(5)
    @newest_users = User.last(5)
  end
end
