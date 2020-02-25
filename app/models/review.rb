class Review < ApplicationRecord
has_one :request
validates :rating, presence: true
validates :text, presence: true
end

