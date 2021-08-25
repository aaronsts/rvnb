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
end
