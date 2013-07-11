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

>>>>>>> 12fa3d75cabb9d5cccd4773d5e32bafad7aa783b
end
