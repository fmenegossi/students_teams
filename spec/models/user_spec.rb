require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "CRUD User" do
    let (:user){ create(:user) }

    it "add a new user" do
      user.valid?
      expect(User.last).to eq user
    end
  end

  describe "Relations" do
    let(:match){ create(:match) }
    let(:user1){ create(:user) }
    let(:user2){ create(:user) }
    let(:user_matches){ create(:user_matches) }

    it "users must be related to the match"

    it "destroy a user must destroy user_matches"
  end
end
