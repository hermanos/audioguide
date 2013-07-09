class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.integer :lat
      t.integer :long

      t.timestamps
    end
  end
end
