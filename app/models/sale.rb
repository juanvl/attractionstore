class Sale < ApplicationRecord
  belongs_to :sale_type
  belongs_to :user
end
