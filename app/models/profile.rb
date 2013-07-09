class Profile < ActiveRecord::Base
  attr_accessible :avatar, :coins, :name, :user_id, :role

  has_one :user
  has_and_belongs_to_many :achievements
  has_many :scans
end
