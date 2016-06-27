class Appointment < ActiveRecord::Base
  belongs_to :candidate

  # Validations
  validates :candidate, presence: true
  validates :begins_at, presence: true
  validates :interviewer_first_name, presence: true
  validates :interviewer_last_name, presence: true
  validates :interviewer_position, presence: true

  def interviewer_full_name
    "#{self.interviewer_first_name.capitalize} #{self.interviewer_last_name}"
  end
end
