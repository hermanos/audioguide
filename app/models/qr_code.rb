class QrCode < ActiveRecord::Base
  attr_accessible :qrcode, :status, :counts

  def self.scan(qr, status)
  	qrcodes = QrCode.where(qrcode: qr)
  	if qrcodes.count == 0
  		QrCode.create!(qrcode: qr, status: status)
  	else
  		qrcode = qrcodes.first
  		qrcode.update_attribute(:counts, qrcode.counts + 1)
  	end
  end
end
