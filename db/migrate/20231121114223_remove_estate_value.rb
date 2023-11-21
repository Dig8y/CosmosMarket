class RemoveEstateValue < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :estate_value, :float
  end
end
