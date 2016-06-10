class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update]
  def index
    @missions = policy_scope(Mission)
  end

  def show
    authorize @mission
  end

  def new
    @mission = Mission.new()
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user #A modifier selon qui créera les missions dans le process
    authorize @mission
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    # mission is set in private
    authorize @mission
  end

  def update
    @mission.update(mission_params)
    authorize @mission
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :edit
    end
  end


  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:title, :status, :company)
  end
end
