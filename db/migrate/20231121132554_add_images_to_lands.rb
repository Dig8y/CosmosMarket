class AddImagesToLands < ActiveRecord::Migration[7.1]
  def change
    add_column :lands, :images, :string, array: true, default: []
  end
end
