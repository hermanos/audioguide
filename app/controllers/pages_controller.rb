class PagesController < ApplicationController

  def index
    if user_signed_in?
      @museums = Museum.all if current_user.is?(:admin)
      @museums = current_user.profile.museums if current_user.is?(:manager)
      @scans = current_user.profile.scans if current_user.is?(:user)

      render "dashboard_#{current_user.profile.role}",
        layout: current_user.is?(:user) ? :default : 'simple'
    end
  end

  def test
    respond_to do |format|
      format.html { render text: 'df' }
      format.json { render json: {doi: 'trei'} }
    end
  end

end
