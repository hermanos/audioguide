class Profile < ActiveRecord::Base
  attr_accessible :avatar, :coins, :name, :user_id

  has_one :user
end
