class Request < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :review, optional: true

  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "declined"] }

end
