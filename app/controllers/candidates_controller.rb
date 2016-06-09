class CandidatesController < ApplicationController
  before_action :set_mission, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_candidate, only: [:edit, :update]

  def new
    @candidate = Candidate.new
    authorize @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.mission = @mission
    authorize @candidate
    if @candidate.save
       redirect_to mission_path(@mission), notice: "The candidate #{@candidate.first_name} #{@candidate.last_name} has been added to your mission." #A changer dans les traduction
    else
       render "new"
    end
  end

  def show
  end

  def edit
    authorize @candidate
  end

  def update
    @candidate.update(candidate_params)
    authorize @candidate
    redirect_to mission_path(@candidate.mission)
  end


  def destroy
  end

  private

  def find_candidate
    @candidate = Candidate.find(params[:id])
  end
  def set_mission
    @mission = Mission.find(params[:mission_id])
  end

  def candidate_params
    params.require(:candidate).permit(:first_name, :last_name, :resume, :resume_cache, :compensation)
  end

end
