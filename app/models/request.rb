class Request < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :review
end
