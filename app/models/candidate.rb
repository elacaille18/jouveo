class Candidate < ActiveRecord::Base
  # Uploads
  mount_uploader :resume, ResumeUploader
  mount_uploader :photo, PhotoUploader

  # Associations
  belongs_to :mission
  has_many :appointments
  has_many :contracts
  has_many :companies, through: :contracts
  has_many :diplomas
  has_many :schools, through: :diplomas

  # Validations
  STATUS = %w(contact_in_progress jouve_interviewing client_interviewing)
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, inclusion: {in: STATUS}

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.upcase}"
  end
end
