class AddPriceToLandsFixed < ActiveRecord::Migration[7.1]
  def change
    add_column :lands, :price, :float
  end
end
