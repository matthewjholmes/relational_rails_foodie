class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :rating

  def dishes_count
    dishes.count
  end

  def alphabetical_dishes
    dishes.order(:name)
  end

  def calories_filter(calories)
    dishes.where("calories > ?", calories)
  end
end
