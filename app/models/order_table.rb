class OrderTable < ApplicationRecord
  belongs_to :userr
  belongs_to :food
  validates :quantity, numericality: true
end
