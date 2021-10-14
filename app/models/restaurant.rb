class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :rating

  def self.order_by_most_recent_creation
    order(created_at: :desc)
  end
end
