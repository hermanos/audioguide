class AddImageToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :image, :string
  end
end
