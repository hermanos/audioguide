class Exhibit < ActiveRecord::Base
  attr_accessible :audio, :description, :floor, :lat, :long, :museum_id, :qr_code, :title, :video

  belongs_to :museum

  after_create :create_qr_code

  has_many :scans
  has_many :profiles, through: :scans

  def create_qr_code
  	exhibit_url = "http://10.0.0.64:3000/museums/" + museum_id.to_s + "/exhibits/" + id.to_s
  	crypt_code = exhibit_url
  	update_attribute(:qr_code, crypt_code)

  end
end