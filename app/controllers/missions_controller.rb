class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update]
  def index
    @missions = policy_scope(Mission).order(created_at: :desc)
  end

  def show
    authorize @mission
  end

  def new
    @mission = Mission.new()
    @mission.users.build
    @team_jouve = User.team_jouve
    @not_jouve = User.not_jouve
    @client = User.new()
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.creator = current_user #A modifier selon qui créera les missions dans le process
    # je regarde qui a la droit d'accès hors jouve
    @alloweds = params[:mission][:user_ids].delete_if { |id| id==""}.map(&:to_i)
    @alloweds.each do |allowed|
      allowed_user = User.find(allowed)
      @mission.users << allowed_user unless @mission.users.include?(allowed_user)
    end

    authorize @mission

    if @mission.save

      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    # mission is set in private
    @team_jouve = User.team_jouve
    @not_jouve = User.not_jouve
    @client = User.new()
    authorize @mission
  end

  def update
    @mission.update(mission_params)
    # Pas besoin de redemander l'update des associations
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
    params.require(:mission).permit(:title, :status, :company_id, :associate_id, :consultant_id, :assistant_id, user_ids: [])
  end
end
