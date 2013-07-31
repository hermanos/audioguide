class Museum < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :published, :description, :image, :remote_image_url, :manager_id

  has_many :exhibits
  belongs_to :manager, class_name: 'Profile'

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :name, length: { minimum: 1 }
  validates :description, presence: true
  validates :description, length: { minimum: 1 }

  def published?
  	self.published == 1
  end	
  
end