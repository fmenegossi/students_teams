class UserMatch < ApplicationRecord
  belongs_to :user
  belongs_to :match

  def self.generate_matches(match_date, team_size)
    students = User.available_students(match_date).shuffle

    teams = build_mixed_teams(students, team_size)

    user_matches = []

    teams.each do |team|
      if match = Match.create!(date: match_date)
        team.each do |member|
          user_matches << UserMatch.create!(match: match, user: member)
        end
      else
        return match
      end
    end

    user_matches
  end

  def self.build_mixed_teams(members, team_size)
    puts members
    puts team_size
    teams = []
    members.each_slice(team_size){ |team| teams << team }

    if teams.last.size == 1
      teams[rand(0..teams.size - 2)] << teams.pop[0]
    end

    teams
  end
end
