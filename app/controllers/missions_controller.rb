class MissionsController < ApplicationController
  before_action :set_mission, only: [:show]
  def index
    @missions = policy_scope(Mission)
  end

  def show
    authorize @mission
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end
end
