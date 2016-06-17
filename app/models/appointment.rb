class Appointment < ActiveRecord::Base
  belongs_to :candidate
end
