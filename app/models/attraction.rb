class Attraction < ApplicationRecord
  belongs_to :company
  has_one_attached :picture
end
