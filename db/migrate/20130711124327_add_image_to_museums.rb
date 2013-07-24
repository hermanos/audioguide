class AddImageToMuseums < ActiveRecord::Migration
  def change
    add_column :museums, :image, :string
  end
end
