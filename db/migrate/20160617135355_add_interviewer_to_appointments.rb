class AddInterviewerToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :interviewer_first_name, :string
    add_column :appointments, :interviewer_last_name, :string
    add_column :appointments, :interviewer_position, :string
  end
end
