class Exhibit < ActiveRecord::Base
  attr_accessible :floor, :lat, :long, :museum_id, :qr_code, :video, :private, :image, :remote_image_url,
                  :description_IT, :description_EN,:description_RO, :description_DE, :description_FR, :description_SP, :title_IT, 
                  :title_EN, :title_DE, :title_FR, :title_SP, :title_RO    


  belongs_to :museum
  has_many :scans

  mount_uploader :image, ImageUploader

  validates :floor, numericality: true
  validates :lat, numericality: true
  validates :long, numericality: true

  after_create :create_qr_code

  def private?
    self.private == 1
  end

  private

  def create_qr_code
    if self.qr_code == nil
    	exhibit_url = Rails.application.routes.url_helpers.museum_exhibit_url(museum, self)
    	crypt_code = exhibit_url
    	update_attribute(:qr_code, crypt_code)
    else
      q = QrCode.where(qrcode: self.qr_code).first
      q.update_attribute(:status, "found") unless q.nil?
    end
  end

end