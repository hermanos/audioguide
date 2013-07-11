class Museum < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :published, :description, :manager_id

  has_many :exhibits
  belongs_to :manager, class_name: 'Profile'
  
  validates :name, presence: true
  validates :name, length: {minimum: 1}
  validates :description, presence: true
  validates :description, length: {minimum: 1}

end