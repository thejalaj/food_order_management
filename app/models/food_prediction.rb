class FoodPrediction < ApplicationRecord
  belongs_to :userr
  belongs_to :food
  has_many :order_tables
end
