class Api::UserMatchesController < Api::BaseApiController
  def create
    date = params[:date]
    team_size = params[:team_size]
    user_matches = UserMatch.generate_matches(Date.parse(date), team_size)

    if user_matches.empty?
      render(
        {
          status: 204,
          json: "No students available for this data"
        }
      )
    else
      render(
        {
          status: 201,
          json: user_matches
        }
      )
    end
  end
end
