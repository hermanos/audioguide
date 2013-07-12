class AddImageToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :image, :string
  end
end
