class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :manager_id, default: 0
      t.integer :published, default: 0 
      t.text :description

      t.timestamps
    end
  end
end
