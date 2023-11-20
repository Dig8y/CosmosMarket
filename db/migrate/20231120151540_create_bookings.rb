class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :land, null: false, foreign_key: true
      t.float :price
      t.date :booking_start_date
      t.date :booking_end_date

      t.timestamps
    end
  end
end
