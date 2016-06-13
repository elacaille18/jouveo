class Mission < ActiveRecord::Base
  # Associations
  belongs_to :creator, class_name: "User"
  belongs_to :company
  has_many :candidates

  # team Jouve
  belongs_to :associate, class_name: "User"
  belongs_to :consultant, class_name: "User"
  belongs_to :assistant, class_name: "User"

  # Validations
  STATUS = %w(in_progress closed cancelled)
  validates :title, presence: true
  validates :company, presence: true
  validates :status, inclusion: {in: STATUS}
end
