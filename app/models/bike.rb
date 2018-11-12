class Bike < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, PhotoUploader

  has_many :images
  has_many :bookings

  validates :category, :price, :brand, :engine_size, presence: true

  CATEGORIES = ['motorbike', 'scooter']
end
