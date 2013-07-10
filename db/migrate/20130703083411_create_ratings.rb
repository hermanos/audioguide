class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :user_id
      t.integer :exhibit_id

      t.timestamps
    end
  end
end
