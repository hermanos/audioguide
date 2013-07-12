class ApplicationController < ActionController::Base
  protect_from_forgery
	
	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_path, alert: "You are not authorized to do that !"
	end


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
