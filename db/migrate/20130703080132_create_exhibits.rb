class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :title
      t.text :description
      t.string :audio
      t.string :video
      t.integer :floor, default: 0, null: false
      t.float :lat, default: 0, null: false
      t.float :long, default: 0, null: false
      t.string :qr_code
      t.integer :museum_id
      t.integer :private, default: 1, null: false
      t.string :language, default: 'Romana'


      t.timestamps
    end
  end
end
