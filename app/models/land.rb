class Land < ApplicationRecord
  belongs_to :user
  validates :area, presence: true
  validates :area, numericality: { only_integer: true }
  validates :address, presence: true
end
