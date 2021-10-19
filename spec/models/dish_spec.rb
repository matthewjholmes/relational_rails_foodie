require 'rails_helper'

describe Dish do

  describe 'relationships' do
    it { should belong_to :restaurant }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    # it { is_expected.to validate_inclusion_of(:seasonal).in_array([true, false]) }
    it { should validate_presence_of :calories }
    it { should validate_presence_of :restaurant_id }
  end

  describe 'model methods' do
    before do
      restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create(name: 'Soup', seasonal: true, calories: 450, restaurant_id: restaurant1.id)
      @dish2 = Dish.create(name: 'Salad', seasonal: true, calories: 300, restaurant_id: restaurant1.id)
      @dish3 = Dish.create(name: 'Sandwich', seasonal: false, calories: 950, restaurant_id: restaurant1.id)
    end

    it 'can return only seasonal dishes' do
      dishes = Dish.seasonal_filter
      expect(dishes).to eq([@dish1, @dish2])
    end
  end
end
