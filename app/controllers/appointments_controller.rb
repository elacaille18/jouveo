class AppointmentsController < ApplicationController
  def create
    @appointment = Appointment.new(appointment_params)
    authorize @appointment
  end

  private

  def appointment_params
    params.require(:appointment).permit(:candidate, :begins_at)
  end
end
