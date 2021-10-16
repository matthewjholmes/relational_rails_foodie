
class FarmersMarket < ApplicationRecord
  has_many :produces, dependent: :destroy

  validates_presence_of :name
  #how can we use 'validates_presence_of' with our boolean
  validates_presence_of :vendor_count

  def produce_count
    produces.length
  end

  def alphabetical_produces
    produces.order(:name)
  end
end
