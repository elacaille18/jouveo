class School < ActiveRecord::Base
  # Associations
  has_many :diplomas
  has_many :candidates, through: :diplomas

end
