class SolutionsController < ApplicationController
  before_action :set_challenge, only: [:index, :create]
  load_and_authorize_resource

  # GET /solutions
  # GET /solutions.json
  def index
    @solutions = Solution.all
  end

  # POST /solutions
  # POST /solutions.json
  def create
    if current_user.solved_challenges.include? @challenge
      flash.notice = "You've already solved this challenge!"
      redirect_to @challenge
    elsif @challenge.answer == params[:answer]
      @solution = Solution.new(user: current_user, challenge: @challenge)
      respond_to do |format|
        if @solution.save
          format.html { redirect_to @challenge, notice: 'You solved this challenge!' }
          format.json { render :show, status: :created, location: @solution }
        else
          format.html { render :new }
          format.json { render json: @solution.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.alert = "Your answer is wrong!"
      redirect_to @challenge
    end
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
