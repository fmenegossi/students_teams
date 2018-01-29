class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_matches , dependent: :destroy
  has_many :matches, through: :user_matches

  def is_admin?
    is_admin
  end
end
