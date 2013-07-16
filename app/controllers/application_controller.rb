class ApplicationController < ActionController::Base
  protect_from_forgery
	
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

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
