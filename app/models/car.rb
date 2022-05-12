class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :delete_all
  validates :year, :brand, :category, :model, :city, :price, presence: true
  validates :category, inclusion: { in: ['classic', 'sport', 'SUV', 'unique', 'others'] }
  geocoded_by :city
  after_validation :geocode

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_model,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true }
    }
end
