class UsersController < ApplicationController

  before_action :set_user , only: [:index]

  def index
  end

  private

  def set_user
    @user = current_user
  end
end
