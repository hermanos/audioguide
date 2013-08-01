class AddTextToExhibit < ActiveRecord::Migration
  def change
    remove_column :exhibits, :description_IT
    remove_column :exhibits, :description_RO
    remove_column :exhibits, :description_ES
    remove_column :exhibits, :description_EN
    remove_column :exhibits, :description_FR
    remove_column :exhibits, :description_DE
    add_column :exhibits, :description_IT, :text
    add_column :exhibits, :description_RO, :text
    add_column :exhibits, :description_ES, :text
    add_column :exhibits, :description_EN, :text
    add_column :exhibits, :description_FR, :text
    add_column :exhibits, :description_DE, :text
  end
end
