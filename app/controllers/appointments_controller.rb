class AppointmentsController < ApplicationController
  before_action :find_mission, only: [:create]
  before_action :set_candidate, only: [:create, :destroy]
  before_action :find_appointment, only: [:edit, :update, :destroy]

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.candidate = @candidate
    authorize @appointment
    if @appointment.save
      redirect_to mission_path(@mission)
    end
  end

  def edit

    authorize @appointment
  end


  def update

    @appointment.update(appointment_params)
    authorize @appointment
    @mission = @appointment.candidate.mission
    if @appointment.save
      redirect_to mission_path(@mission)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy

    authorize @appointment
    redirect_to mission_path(@candidate.mission)
  end


  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def find_mission
    @mission = Mission.find(params[:mission_id])
  end

  def set_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end

  def appointment_params
    params.require(:appointment).permit(:begins_at, :interviewer_first_name, :interviewer_last_name, :interviewer_position)
  end
end
