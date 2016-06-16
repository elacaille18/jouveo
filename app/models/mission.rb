class Mission < ActiveRecord::Base
  # Associations
  belongs_to :creator, class_name: "User"
  belongs_to :company
  has_many :candidates
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :users

  # team Jouve
  belongs_to :associate, class_name: "User"
  belongs_to :consultant, class_name: "User"
  belongs_to :assistant, class_name: "User"

  # Validations
  STATUS = %w(in_progress closed cancelled)
  validates :title, presence: true
  validates :company, presence: true
  validates :status, inclusion: {in: STATUS}
  validates :associate, presence: true
  validates :consultant, presence: true
  validates :assistant, presence: true
end
