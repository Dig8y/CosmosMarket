class RemovePriceFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :price, :float
  end
end
