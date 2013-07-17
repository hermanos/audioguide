class Museum < ActiveRecord::Base
  attr_accessible :lat, :long, :name, :manager_id, :published, :description, :image, :remote_image_url

  has_many :exhibits
  belongs_to :manager, class_name: 'Profile'
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :name, length: {minimum: 1}
  validates :description, presence: true
  validates :description, length: {minimum: 1}

end