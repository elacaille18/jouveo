class Mission < ActiveRecord::Base
  include AlgoliaSearch


  # Associations
  belongs_to :creator, class_name: "User"
  belongs_to :company
  has_many :candidates
  has_many :appointments, through: :candidates
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :users

  # search
  algoliasearch synchronous: true do
    attributes :title
    attributes :company do
      { name: company.name }
    end

    attributesToIndex ['title', 'company']
  end
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
