class Produce < ApplicationRecord
  belongs_to :farmers_market

  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :farmers_market_id

  def self.seasonal_filter
    where(seasonal: true)
  end 
end
