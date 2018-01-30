class Api::UserMatchesController < Api::BaseApiController
  before_action :set_user, only: [:show]

  def index
    @matches = Match.all_matches

    render(
      {
        status: 200,
        json: @matches
      }
    )
  end

  def show
    @past_matches = @user.past_matches
    @today_match = @user.today_match

    render(
      {
        status: 200,
        json: [@past_matches, @today_match]
      }
    )
  end

  private

  def set_user
    @user = current_user
  end
end
