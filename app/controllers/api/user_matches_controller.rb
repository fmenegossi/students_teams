class Api::UserMatchesController < Api::BaseApiController
  def create
    user_matches = UserMatch.generate_matches(user_matches_params)

    if user_matches.errors.present?
      render(
        {
          status: 422,
          message: user_matches.errors,
          json: user_matches
        }.to_json
      )
    else
      render(
        {
          status: 201,
          json: user_matches
        }.to_json
      )
    end
  end

  private

  def user_matches_params
    params.require(:user_match).permit(:date, :team_size)
  end
end
