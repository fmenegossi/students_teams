class UserMatch < ApplicationRecord
  belongs_to :user
  belongs_to :match

  def self.generate_matches(match_date, team_size)
    students = User.available_students(match_date)
    teams = build_mixed_teams(students, team_size)

    # byebug
    user_matches = []

    teams.each do |team|
      if match = Match.create!(date: match_date)
        team.each do |member|
          user_matches << UserMatch.create!(match: match, user: member)
        end
      end
    end

    user_matches
  end

  def self.build_mixed_teams(members, team_size)
    teams = []
    members.shuffle!

    members.each_slice(team_size){ |team| teams << team }

    if (!teams.empty?) && (teams.last.size == 1)
      teams[rand(0..(teams.size - 2))] << teams.pop[0]
    end

    teams.each do |team|
      team_ids = team.pluck(:id)

      team.each do |student|
        past_matches = []
        last_match = get_last_match(student)
        other_students = User.all_other_students(student)

        past_matches = get_past_matches(student)
        # past_matches.where(user: other_students)
        past_matches.where(user_id: other_students).pluck(:user_id)

        if (past_matches.include?(team_ids))
          if (past_matches.size % other_students.size > 0) || (last_match == team_ids)
            return build_mixed_teams(members, team_size)
          end
        end
      end
    end

    teams
  end

  def self.get_last_match(student)
    UserMatch.where(match: student.matches.last).pluck(:user_id)
  end

  def self.get_past_matches(student)
    past_matches = UserMatch.all.where(match: student.matches)
  end
end
