module ApplicationHelper
	def loged?
  	 	return session[:curent_user].nil?
   end
  
  def get_menu_active(menu_option)
  		return 'active' if menu_option == 'home' and controller_name == 'pages' and action_name == 'index' 
  		''
  end
end

