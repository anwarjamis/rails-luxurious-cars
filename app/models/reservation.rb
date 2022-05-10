class Reservation < ApplicationRecord
  belongs_to :car, optional: true
  belongs_to :user, optional: true
  validates :start_date, :end_date, :amount, presence: true
end
