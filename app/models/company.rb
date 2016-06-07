class Company < ActiveRecord::Base
  # Associations
  has_many :contracts
  has_many :candidates, through: :contracts
end
