class Profile < ActiveRecord::Base
  attr_accessible :coins, :name, :user_id, :role, :image, :remote_image_url

  has_one :user
  has_and_belongs_to_many :achievements
  has_many :scans
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :name, length: {minimum: 1}
  validates :role, presence: true
end
