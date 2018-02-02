class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_matches, dependent: :destroy
  has_many :matches, through: :user_matches

  has_many :student_groups, dependent: :destroy
  has_many :groups, through: :student_groups

  def self.available_students(match_date)
    available = []

    all_students.each do |student|
      if student.matches.find_by(date: match_date)
        next
      else
        available << student
      end
    end

    available
  end

  def self.all_students
    User.all.where(is_admin: false)
  end

  def self.all_admins
    User.all.where(is_admin: true)
  end

  def self.all_other_users(user_id)
    User.all.where.not(id: user_id)
  end

  def self.all_other_students(student)
    all_students.where.not(id: student)
  end

  def past_matches
    matches.where("date < ?", Date.today)
  end

  def today_match
    matches.find_by(date: Date.today)
  end

  def is_admin?
    is_admin
  end
end
