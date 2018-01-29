class PagesController < ApplicationController

  def home

    if current_user
      @role = current_user.is_admin ? 'admin' : 'student'

      if current_user.is_admin
        render "/pages/_admin"
      else
        render "/pages/_student"
      end
    else
      redirect_to new_user_session_path
    end
  end

end
