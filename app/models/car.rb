class Car < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_one_attached :photo

  validates :photo, presence: true
  validates :brand, presence: true
  validates :number_of_seats, presence: true
  validates :registration_number, presence: true, uniqueness: true
  validates :transmission, presence: true
  validates :price, presence: true
end
