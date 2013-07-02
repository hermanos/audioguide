class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def redirect_unloged!
  	redirect_to index_path if session[:curent_user].nil?
  	
  end
end
