class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :land
end
