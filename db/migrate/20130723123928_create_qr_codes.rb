class CreateQrCodes < ActiveRecord::Migration
  def change
    create_table :qr_codes do |t|
      t.string :qrcode
      t.string :status, default: 'new'

      t.timestamps
    end
  end
end
