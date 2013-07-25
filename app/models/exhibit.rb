class Exhibit < ActiveRecord::Base
  attr_accessible :audio, :description, :floor, :lat, :long, :museum_id, :qr_code,
    :title, :video, :private, :image, :remote_image_url, :language

  belongs_to :museum
  has_many :scans

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :title, length: { minimum: 1 }
  validates :description, presence: true
  validates :description, length: { minimum: 1 }

  validates :floor, numericality: true
  validates :lat, numericality: true
  validates :long, numericality: true

  after_create :create_qr_code

  def private?
    self.private == 1
  end

  private

  def create_qr_code
  	exhibit_url = Rails.application.routes.url_helpers.museum_exhibit_url(museum, self)
  	crypt_code = exhibit_url
  	update_attribute(:qr_code, crypt_code)
  end

end