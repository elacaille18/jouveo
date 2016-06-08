class Candidate < ActiveRecord::Base
  # Associations
  belongs_to :mission
  has_many :contracts
  has_many :companies, through: :contracts
  has_many :diplomas
  has_many :schools, through: :diplomas

end
