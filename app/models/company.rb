class Company < ActiveRecord::Base
  # Associations
  has_many :candidates
  has_many :users

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false}
end
