class AddLanguageToExhibit < ActiveRecord::Migration
  def change
   	remove_column :exhibits, :description
   	remove_column :exhibits, :title 
   	remove_column :exhibits, :audio
    remove_column :exhibits, :language
    add_column :exhibits, :description_IT, :string
    add_column :exhibits, :description_RO, :string
    add_column :exhibits, :description_ES, :string
    add_column :exhibits, :description_EN, :string
    add_column :exhibits, :description_FR, :string
    add_column :exhibits, :description_DE, :string
    add_column :exhibits, :title_IT, :string
    add_column :exhibits, :title_ES, :string
    add_column :exhibits, :title_EN, :string
    add_column :exhibits, :title_DE, :string
    add_column :exhibits, :title_FR, :string
    add_column :exhibits, :title_RO, :string
  end
end
