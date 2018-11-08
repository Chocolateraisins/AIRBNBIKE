class User < ApplicationRecord
  has_many :bikes, dependent: :destroy
  has_many :bookings
end
