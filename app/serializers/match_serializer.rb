class MatchSerializer < ActiveModel::Serializer
  attributes :id, :date

  has_many :user_matches
  has_many :users, through: :user_matches
end
