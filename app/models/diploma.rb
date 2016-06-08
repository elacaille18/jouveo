class Diploma < ActiveRecord::Base
  # Associations
  belongs_to :school
  belongs_to :candidate
end
