require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "CRUD Match" do
    let (:match){ create(:match) }

    it "add a new match" do
      match.valid?
      expect(Match.last).to eq match
    end

    it "can't add a match without a date"

    it "can't add a match in the past"

    it "destroy a match"
  end

  describe "Relations" do
    let(:match){ create(:match) }
    let(:user1){ create(:user) }
    let(:user2){ create(:user) }
    let(:user_matches){ create(:user_matches) }

    it "users must be related to the match"

    it "match must be related to the users"

    it "destroy a match must destroy user_matches"

    it "destroy a user must destroy user_matches"
  end
end
