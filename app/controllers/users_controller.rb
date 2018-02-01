class UsersController < ApplicationController

  before_action :set_user , only: [:index]

  def index

    @role = @user.is_admin ? 'Admin' : 'Student'
  end

  private

  def set_user
    @user = current_user
  end
end
