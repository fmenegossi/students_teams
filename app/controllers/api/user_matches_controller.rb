class Api::UserMatchesController < Api::BaseApiController
  def create
    date = params[:date]
    team_size = params[:team_size]

    # byebug

    user_matches = UserMatch.generate_matches(Date.parse(date), team_size)

    if user_matches.errors.present?
      render(
        {
          status: 422,
          message: user_matches.errors,
          json: user_matches
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

  private

  def user_matches_params
    params.require(:user_match).permit(:date, :team_size)
  end
end
