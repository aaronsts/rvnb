class Listing < ApplicationRecord
  belongs_to :user

  # Validations
  validates :vehicle_name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }, length: { maximum: 10 }
  validates :price, presence: true, numericality: true

  # geocoding
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model

  pg_search_scope :search_by_name,
    against: [ :vehicle_name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_capacity,
    against: [ :capacity ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_price,
    against: [ :price ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
