class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :title
      t.text :description
      t.string :audio
      t.string :video
      t.integer :floor
      t.float :lat
      t.float :long
      t.string :qr_code
      t.integer :museum_id
      t.integer :private, default: 1
      

      t.timestamps
    end
  end
end
