class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def redirect_unloged!
  	redirect_to index_path if session[:curent_user].nil?
  	
  end

  def after_sign_in_path_for(resource_or_scope)
	 	dashboard_path
	end

	def after_sign_out_path_for(resource_or_scope)
  	index_path
	end

end
