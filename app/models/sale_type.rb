class SaleType < ApplicationRecord
  belongs_to :attraction
  belongs_to :customer_type
end
