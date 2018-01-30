class Match < ApplicationRecord
  has_many :user_matches, dependent: :destroy
  has_many :users, through: :user_matches

  validates :date, presence: true
  #validate :date_cannot_be_in_the_past

  def self.all_matches
    Match.all
  end

  def self.matches_in_date(date)
    Match.find_by(:date, date)
  end

  private

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
