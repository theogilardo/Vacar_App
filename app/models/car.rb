class Car < ApplicationRecord
  LOCATIONS = %w(Orly Malpensa CDG-Paris Linate Heathrow)
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :reviews, through: :requests
  has_one_attached :photo

  validates :photo, presence: true
  validates :brand, presence: true
  validates :number_of_seats, presence: true
  validates :registration_number, presence: true, uniqueness: true
  validates :transmission, presence: true
  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
end
