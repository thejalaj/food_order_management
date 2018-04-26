class Food < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  has_many :order_tables
  has_many :food_predictions
end
