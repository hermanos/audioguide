class QrCode < ActiveRecord::Base
  attr_accessible :qrcode, :status

  def self.scan(qr)
  	QrCode.create!(qrcode: qr, status: "found")
  end
end
