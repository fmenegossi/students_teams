class UserMatch < ApplicationRecord
  belongs_to :user
  belongs_to :match

  def self.generate_matches(match_date, team_size)
    students = User.available_students(match_date)

    if team_size > (students.size / 2)
      return []
    end

    teams = build_mixed_teams(students, team_size)
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
    members = members.shuffle
    members.each_slice(team_size){ |team| teams << team }
    teams = distribute_remaining(teams, team_size) unless teams.empty?

    teams.each do |team|
      team_ids = team.pluck(:id)

      team.each do |student|
        past_matches = []
        last_match = get_last_match(student)
        other_students = User.all_other_students(student)
        past_matches = get_past_matches(student)
        past_matches = past_matches.where(user_id: other_students).pluck(:user_id)
        max_combinations = get_max_combinations(members.size, team_size)

        if (past_matches.include?(team_ids)) &&
          (past_matches.size % max_combinations > 0)
          return build_mixed_teams(members, team_size)
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

  def self.distribute_remaining(teams, team_size)
    if (teams.last.size < team_size) && (teams.size > 2)
      teams.pop.each do |remaining|
        loop do
          index = rand(0...(teams.size - 1))
          (teams[index].size > team_size) ? next : teams[index] << remaining
          break
        end
      end
    end

    teams
  end

  def self.get_max_combinations(number_of_members, team_size)
    other_members = number_of_members - 1
    if team_size > 2
      1 * (other_members.downto(other_members - (team_size - 1))).inject(:*)
    else
      other_members
    end
  end
end
