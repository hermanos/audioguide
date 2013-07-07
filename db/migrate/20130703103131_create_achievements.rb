class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :profile_id

      t.timestamps
    end
  end
end
