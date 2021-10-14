class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :rating

  def dishes_count
    dishes.length
  end
end
