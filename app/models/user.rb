class User < ActiveRecord::Base

  # Include default devise modules. Others available are :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile

	has_one :profile

  after_create :create_profile

  # user.is?(:admin) true/false
  def is?(role)
    self.profile.role == role.to_s
  end

  def manage_museum?(museum)
    self.is?(:manager) and self.profile == museum.manager
  end

  private

  def create_profile
    role = Profile.all.blank? ? "admin" : "user"

    p = Profile.create(role: role, name: self.email)
    update_attribute(:profile, p)
  end

end