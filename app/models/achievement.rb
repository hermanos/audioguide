class Achievement < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :profile
end
