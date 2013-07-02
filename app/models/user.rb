class User < ActiveRecord::Base
  attr_accessible :email, :password, :role, :username, :profile

  has_one :profile

  after_create :create_profile

  def create_profile
  	p = Profile.create!
  	update_attributes(profile: p)
  end
end
