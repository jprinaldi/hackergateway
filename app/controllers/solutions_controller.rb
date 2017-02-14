class SolutionsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_challenge, only: :create
  load_and_authorize_resource

  # GET /solutions
  def index
    if params[:user_id]
      user_solutions
    elsif params[:challenge_id]
      challenge_solutions
    else
      @solutions = Solution.includes(:user, :challenge).all
    end
  end

  def user_solutions
    @user = User.includes(solutions: :challenge)
                .friendly.find(params[:user_id])
    render :user_solutions
  end

  def challenge_solutions
    @challenge = Challenge.includes(solutions: :user)
                          .friendly.find(params[:challenge_id])
    render :challenge_solutions
  end

  # POST /solutions
  def create
    if !verify_recaptcha
    elsif current_user.solved? @challenge
      flash.notice = "You've already solved this challenge!"
    elsif @challenge.check(params[:answer])
      current_user.solve(@challenge)
      flash[:success] = "You solved this challenge!"
    else
      flash[:error] = "Your answer is wrong!"
    end
    redirect_to @challenge
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end
end
