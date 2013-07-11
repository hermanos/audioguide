class ApplicationController < ActionController::Base
  protect_from_forgery


  def redirectIfUser
    user = current_user
    if user.profile.role == 'user'
      redirect_to museum_path(params[:museum_id])
      return
    end
  end

  def get_layout
  	
  end

end
