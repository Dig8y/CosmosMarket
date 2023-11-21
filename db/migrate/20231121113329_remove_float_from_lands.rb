class RemoveFloatFromLands < ActiveRecord::Migration[7.1]
  def change
    remove_column :lands, :float, :string
  end
end
