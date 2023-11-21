class RemovePriceFromLands < ActiveRecord::Migration[7.1]
  def change
    remove_column :lands, :price, :string
  end
end
