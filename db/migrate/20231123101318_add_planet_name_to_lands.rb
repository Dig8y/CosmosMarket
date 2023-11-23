class AddPlanetNameToLands < ActiveRecord::Migration[7.1]
  def change
    add_column :lands, :planet_name, :string
  end
end
