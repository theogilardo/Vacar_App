class Car < ApplicationRecord
  belongs_to :user
  has_many :requests

  validates :brand, presence: true
  validates :number_of_seats, presence: true
  validates :registration_number, presence: true, uniqueness: true
  validates :transmission, presence: true
  validates :airconditioning, presence: true
end
