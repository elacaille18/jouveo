class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.team_jouve
    User.where("jouve = ?", true)
    # .map { |member| "#{member.first_name} #{member.last_name}"}
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
