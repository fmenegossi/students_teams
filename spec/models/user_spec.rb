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

    let(:user_match1){ create(:user_match , user: user1 , match: match) }
    let(:user_match2){ create(:user_match , user: user2 , match: match) }

    it "users must be related to the match" do

      user_match1.valid?
      user_match2.valid?

      expect(user1.matches.present?).to be(true)
    end

    it "destroy a user must destroy user_matches" do

      user_match1.valid?
      user_match2.valid?
      user1.destroy

      expect(UserMatch.all.count).to eq(1)
    end
  end

end
