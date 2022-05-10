class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :start_date, :end_date, :amount, presence: true
end
