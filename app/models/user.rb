class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_matches , dependent: :destroy
  has_many :matches, through: :user_matches

  def self.students
    User.all.where(is_admin: false)
  end

  def self.admins
    User.all.where(is_admin: true)
  end

  def past_matches
    matches.where("date <= ?", Date.today)
  end

  def is_admin?
    is_admin
  end
end
