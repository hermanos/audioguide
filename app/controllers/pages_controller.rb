class PagesController < ApplicationController

  def index
    if user_signed_in?

      @user = current_user
      if @user.profile.role == "admin"
        render 'dashboard_admin'
        return
      elsif @user.profile.role == "manager"
        render 'dashboard_manager'
        return
      else
        render 'dashboard_user'
        return
      end

    end
  end

  def users_reset
    @user = User.all
    render 'reset'
    return
  end

end
