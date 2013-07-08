class Exhibit < ActiveRecord::Base
  attr_accessible :audio, :description, :floor, :lat, :long, :museum_id, :qr_code, :title, :video

  belongs_to :museum

  after_create :create_qr_code

  def create_qr_code

  	crypt_code = Digest::MD5.hexdigest(id.to_s + "-" + Time.now.to_s)
  	update_attribute(:qr_code, crypt_code)

  end
end
