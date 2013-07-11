class Museum < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :manager_id, :published, :description

  has_many :exhibits

  validates :name, presence: true
  validates :name, length: {minimum: 1}
  validates :manager_id, presence: true
  validates :description, presence: true
  validates :description, length: {minimum: 1}

end