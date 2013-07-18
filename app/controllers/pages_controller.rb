class PagesController < ApplicationController

  def index
    if user_signed_in?

      @user = current_user
      if @user.admin?
        render 'dashboard_admin', layout: 'simple'
        return
      elsif @user.manager?
        @museum = Museum.all
        render 'dashboard_manager', layout: 'simple'
        return
      else
        @scans = Scan.all
        @scan_prof = []
        @scans.each do |s|
          @scan_prof << s if s.profile_id == @user.profile.id
        end
        @exhibit = Exhibit.last
        render 'dashboard_user'
        return
      end

    end
  end

  def test
    respond_to do |format|
      format.html { render text: 'tst' }
      format.json { render json: {doi: 'trei'} }
    end
  end

  def users_reset
    @user = User.all
    render 'reset'
    return
  end

end
