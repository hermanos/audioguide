class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile
  # attr_accessible :title, :body
  
	has_one :profile

 
  after_create :create_profile

  def create_profile
    p = Profile.create!(role: 'user', name: "Guest")
    update_attribute(:profile, p)
  end
    
  def admin?
    self.profile.role == "admin" ? true : false
  end

  def museum_manager?(museum)
    
    if self.profile.role == "manager" and self.profile.id == museum.manager_id
      return true
    else
      return false
    end

  end
end