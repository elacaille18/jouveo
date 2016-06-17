class AppointmentsController < ApplicationController
  before_action :find_mission, only: [:create]
  before_action :set_candidate, only: [:create]

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.candidate = @candidate
    authorize @appointment
    if @appointment.save
      redirect_to mission_path(@mission)
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end


  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    authorize @appointment
    @mission = @appointment.candidate.mission
    if @appointment.save
      redirect_to mission_path(@mission)
    else
      render :edit
    end

  end


  private

  def find_mission
    @mission = Mission.find(params[:mission_id])
  end

  def set_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end

  def appointment_params
    params.require(:appointment).permit(:begins_at)
  end
end
