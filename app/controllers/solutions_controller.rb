class SolutionsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_challenge, only: :create
  load_and_authorize_resource

  # GET /solutions
  # GET /solutions.json
  def index
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
      render :challenges
    elsif params[:challenge_id]
      @challenge = Challenge.friendly.find(params[:challenge_id])
      render :users
    else
      @solutions = Solution.all
    end
  end

  # POST /solutions
  # POST /solutions.json
  def create
    if current_user.solved_challenges.include? @challenge
      flash.notice = "You've already solved this challenge!"
    elsif @challenge.answer == params[:answer]
      @solution = Solution.new(user: current_user, challenge: @challenge)
      if @solution.save
        flash[:success] = "You solved this challenge!"
      else
        flash[:error] = "Something went wrong!"
      end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      { user_id: current_user.id, challenge_id: :challenge_id }
    end
end
