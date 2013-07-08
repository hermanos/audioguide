class PagesController < ApplicationController
  
  def index
    if user_signed_in?
      @user = current_user
      render dashboard
      return
    end

  end

  def dashboard
  	# 	Aici trebuie verificat daca userul : 
	  # 		1. Este logat
	  # 		2. Este admin/user (role-ul din profilul userului)
	  # 	In functie de 1 si 2 userul este redirectionat catre :
	  # 		1 = false (nu este logat) => pag de sign_in (care are obtiune de new PAPuser)
	  # 		1 = true => 2 = user => pagina pentru utilizatori (doar show)
	  # 				 => 2 = admin => pagina pentru admini (se poate edita + sterge)
  
  	if user_signed_in?
  	# 	check the user's role
  		@user = current_user
  	else
  		redirect_unloged!
  	end	
  end
end