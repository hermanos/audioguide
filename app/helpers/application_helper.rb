module ApplicationHelper
	def loged?
  	
  	if session[:curent_user].nil?
  		return false
  	else
  		return true
  	end
  end
  
end
