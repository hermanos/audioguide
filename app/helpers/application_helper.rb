module ApplicationHelper

  	def logged?
  	 	return !session[:curent_user].nil?
   end
end
