class Exhibit < ActiveRecord::Base
  attr_accessible :audio, :description, :floor, :lat, :long, :museum_id, :qr_code, :title, :video, :private, :image, :remote_image_url

  belongs_to :museum
  has_many :scans

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :title, length: {minimum: 1}
  validates :description, presence: true
  validates :description, length: {minimum: 1}
  validates :floor, presence: true
  validates :floor, numericality: true
  validates :lat, presence: true
  validates :lat, numericality: true
  validates :long, presence: true
  validates :long, numericality: true
  validates :museum_id, presence: true
  validates :qr_code, presence: true
  validates :private, presence: true


  after_create :create_qr_code
  def create_qr_code
  	exhibit_url = "http://10.0.0.64:3000/museums/" + museum_id.to_s + "/exhibits/" + id.to_s
  	crypt_code = exhibit_url
  	update_attribute(:qr_code, crypt_code)
  end
  
  def private?
    self.private == "1" ? true : false
  end

end