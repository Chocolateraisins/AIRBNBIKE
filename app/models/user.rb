class User < ApplicationRecord
  has_many :bikes, dependent: :destroy
  has_many :bookings

  validates :email, :first_name, :last_name, :phone_number, :presence true
  validates :email, :phone_number, uniqueness: true
end
