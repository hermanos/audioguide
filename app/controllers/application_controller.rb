class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def redirect_unloged!
  	session[:curent_user].nil?
  		redirect_to index_path
  end
end
