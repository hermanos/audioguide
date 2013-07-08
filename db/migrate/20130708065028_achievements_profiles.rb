class AchievementsProfiles < ActiveRecord::Migration
  def change
    create_table :achievements_profiles do |t|
      t.integer :achievement_id
      t.integer :profile_id

      t.timestamps
    end
  end

  def up
  end

  def down
  end
end
