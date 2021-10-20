class FarmersMarket < ApplicationRecord
  has_many :produces, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :vendor_count

  def produce_count
    produces.count
  end

  def quantity_filter(quantity)
    produces.where("quantity > #{quantity}")
  end

  def alphabetical_produces
    produces.order(:name)
  end
end
