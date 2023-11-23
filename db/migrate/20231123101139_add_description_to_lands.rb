
class AddDescriptionToLands < ActiveRecord::Migration[7.1]
  def change
    add_column :lands, :description, :text
  end
end
