class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :avatar
      t.string :name
      t.string :role
      t.integer :coins

      t.timestamps
    end
  end
end
