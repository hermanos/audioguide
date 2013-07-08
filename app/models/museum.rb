class Museum < ActiveRecord::Base
  attr_accessible :lat, :long, :name

  has_many :exhibits
end
