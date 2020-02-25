class Request < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :review

  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "declined"] }

end
