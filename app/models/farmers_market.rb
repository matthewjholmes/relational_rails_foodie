class FarmersMarket < ApplicationRecord
  has_many :produces, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :vendor_count

  def produce_count
    produces.length
  end
end
