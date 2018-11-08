class Bike < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :bookings
  validates :category, :price, :brand, :engine_size, presence: true
end
