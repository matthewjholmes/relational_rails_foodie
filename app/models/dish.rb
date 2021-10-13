class Dish < ApplicationRecord
  belongs_to :restaurant

  validates_presence_of :name
  validates_presence_of :seasonal
  validates_presence_of :calories
  validates_presence_of :restaurant_id
end
