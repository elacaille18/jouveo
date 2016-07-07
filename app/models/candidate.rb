class Candidate < ActiveRecord::Base
  # Uploads
  mount_uploader :resume, ResumeUploader
  mount_uploader :photo, PhotoUploader

  # Associations
  belongs_to :mission, touch: true
  has_many :appointments, dependent: :destroy


  # Validations
  STATUS = %w(jouve_interviewing client_interviewing rejected)
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, inclusion: {in: STATUS}

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.upcase}"
  end
end
