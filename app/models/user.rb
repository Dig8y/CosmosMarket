class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  TYPES = %w[martian human]

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :lands, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :estate_value, presence: true
  # validates :estate_value, numericality: { :greater_than 0 }
  validates :species, inclusion: TYPES
end
