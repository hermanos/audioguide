class AddCountsToQrCodes < ActiveRecord::Migration
  def change
    add_column :qr_codes, :counts, :integer, default: 1
  end
end
