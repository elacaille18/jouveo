class Appointment < ActiveRecord::Base
  belongs_to :candidate

  def interviewer_full_name
    "#{self.interviewer_first_name.capitalize} #{self.interviewer_last_name}"
  end
end
