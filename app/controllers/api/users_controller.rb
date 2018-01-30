class Api::UsersController < Api::BaseApiController

  before_action :set_user

  def update
    @user.is_admin = !@user.is_admin

    if @user.save!

      render status: 201, json: {
        message: 'toggled user',
        user: @user
      }.to_json
    else
      render status: 422, json: {
        errors: @user.errors
      }.to_json
       end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
