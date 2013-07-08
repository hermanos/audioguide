class Exhibit < ActiveRecord::Base
  attr_accessible :audio, :description, :floor, :lat, :long, :museum_id, :qr_code, :title, :video

  belongs_to :museum

  after_create :create_qr_code

  def create_qr_code
  	exhibit_url = "http://localhost:3000/museums/" + museum_id.to_s + "/exhibits/" + id.to_s
  	crypt_code = exhibit_url
  	update_attribute(:qr_code, crypt_code)

  end
end