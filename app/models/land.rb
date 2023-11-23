class Land < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :area, presence: true
  validates :area, numericality: { only_integer: true }
  validates :address, presence: true
  validates :planet_name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 20 }
end
