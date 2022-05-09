class Reservation < ApplicationRecord
  belongs_to :cars
  belongs_to :users
  validates :start_date, :end_date, :amount, presence: true
end
