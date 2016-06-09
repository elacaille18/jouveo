class Mission < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :candidates

  # Validations
  STATUS = %w(in_progress closed cancelled)
  validates :title, presence: true
  validates :status, inclusion: {in: STATUS}
end
