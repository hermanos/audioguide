class Profile < ActiveRecord::Base
  attr_accessible :avatar, :coins, :name, :user_id, :role

  has_one :user
end
