class Land < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :area, presence: true
  validates :area, numericality: { only_integer: true }
  validates :address, presence: true
end
