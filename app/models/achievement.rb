class Achievement < ActiveRecord::Base
  attr_accessible :description, :profile_id, :title, :image, :remote_image_url

  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :profiles

  validates :title, presence: true
  validates :description, presence: true
end
