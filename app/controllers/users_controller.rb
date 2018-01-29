class UsersController < ApplicationController
  def index
    @user = current_user
    @role = @user.is_admin ? 'Admin' : 'Student'
  end
end
