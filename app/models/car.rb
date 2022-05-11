class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :delete_all
  validates :year, :brand, :category, :model, :city, :price, presence: true
  validates :category, inclusion: { in: ['classic', 'sport', 'SUV', 'unique', 'others'] }
end
