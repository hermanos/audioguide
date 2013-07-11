class ApplicationController < ActionController::Base
  protect_from_forgery
	
	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_path, alert: "You are not authorized to do that !"
	end

end
