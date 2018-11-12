class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes, dependent: :destroy
  # has_many :bikes, through: :bookings
  has_many :bookings

  validates :email, presence: true #, :first_name, :last_name, :phone_number
  validates :email, uniqueness: true #, :phone_number,

  def full_name
    "#{first_name} #{last_name}"
  end
end
