class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Uploads
  mount_uploader :photo, PhotoUploader

  # Associations
  has_and_belongs_to_many :missions

  def self.team_jouve
    User.where("jouve = ?", true)
    # .map { |member| "#{member.first_name} #{member.last_name}"}
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def one_picture_url
    if self.photo.url
      self.photo.url
    else
      "http://www.fao.org/fileadmin/templates/aiq2013/images/user-placeholder.jpg"
    end
  end
end
