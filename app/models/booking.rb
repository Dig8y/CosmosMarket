class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :land
  validates :price, numericality: { greater_than: 0}
  validates :booking_start_date, presence: true
  validates :booking_end_date, presence: true
end
