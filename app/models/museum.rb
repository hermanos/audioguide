class Museum < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :manager_id, :published, :description

  has_many :exhibits

end
