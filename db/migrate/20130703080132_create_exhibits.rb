class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :title
      t.text :description
      t.string :audio
      t.string :video
      t.integer :floor
      t.integer :lat
      t.integer :long
      t.string :qr_code
      t.integer :museum_id
      t.integer :publish
      
      t.timestamps
    end
  end
end
