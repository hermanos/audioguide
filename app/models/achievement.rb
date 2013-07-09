class Achievement < ActiveRecord::Base
  attr_accessible :description, :image, :profile_id, :title

  has_and_belongs_to_many :profiles
end
