class Profile < ActiveRecord::Base
  attr_accessible :coins, :name, :role, :image, :remote_image_url, :user_id

  has_one :user
  has_and_belongs_to_many :achievements
  has_many :scans
  has_many :museums, foreign_key: :manager_id

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :name, length: { minimum: 1 }
  validates :role, presence: true
end
