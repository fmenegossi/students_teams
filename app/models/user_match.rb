class UserMatch < ApplicationRecord
  belongs_to :user
  belongs_to :match

  def generate_matches(date)
    
  end
end
