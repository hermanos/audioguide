module ApplicationHelper
	def loged?
  	 	return session[:curent_user].nil?
   end
  
end
