require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "Validates Match" do
    let (:match){ create(:match) }

    it "add a new match" do
      match.valid?
      expect(Match.last).to eq match
    end

    it "can't add a match without a date" do
      match.date = nil
      match.valid?
      expect(match.errors).to include(:date)
    end

    it "can't add a match in the past" do
      match.date = Date.today - 1.days
      match.valid?
      expect(match.errors).to include(:date)
    end

    it "destroy a match" do
      match.valid?
      expect(Match.last).to eq match
      match.destroy!
      expect(Match.last).not_to eq match
    end
  end

  describe "Relations" do
    let(:match){ create(:match) }
    let(:user1){ create(:user) }
    let(:user2){ create(:user) }
    let(:user_match1){ create(:user_match, user: user1, match: match) }
    let(:user_match2){ create(:user_match, user: user2, match: match) }

    it "match must be related to the users" do
      user_match1.valid?
      user_match2.valid?

      expect(user1.user_matches).to include(user_match1)
      expect(user1.matches).to include(match)
    end

    it "destroy a match must destroy user_matches" do
      user_match1.valid?
      user_match2.valid?

      expect(UserMatch.all.count).to eq(2)
      match.destroy
      expect(UserMatch.all.count).to eq(0)
    end
  end
end
