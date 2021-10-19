class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :rating

  def dishes_count
    #AR count aggregate?
    dishes.length
  end

  def alphabetical_dishes
    dishes.order(:name)
  end

  def calories_filter(calories)
    dishes.where("calories > ?", calories)
  end
end
