class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
      t.integer :user_id
      t.integer :exhibit_id

      t.timestamps
    end
  end
end
