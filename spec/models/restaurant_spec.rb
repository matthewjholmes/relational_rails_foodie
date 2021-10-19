require 'rails_helper'

RSpec.describe Restaurant do
  describe 'relationships' do
    it { should have_many :dishes }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    # it { is_expected.to validate_inclusion_of(:dine_in).in_array([true, false]) }
    it { should validate_presence_of :rating }
  end

  describe 'model methods' do
    before do
      @restaurant1 = Restaurant.create!(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create!(name: 'bbb', seasonal: true, calories: 450, restaurant_id: @restaurant1.id)
      @dish2 = Dish.create!(name: 'aaa', seasonal: true, calories: 300, restaurant_id: @restaurant1.id)
      @dish3 = Dish.create!(name: 'ccc', seasonal: true, calories: 950, restaurant_id: @restaurant1.id)
    end

    it 'can count the number of dishes' do
      expect(@restaurant1.dishes_count).to eq(3)
    end

    it 'can order dishes alphabetically' do
      expect(@restaurant1.alphabetical_dishes).to eq([@dish2, @dish1, @dish3])
    end

    it 'can filter based on calories' do
      expect(@restaurant1.calories_filter(900)).to eq([@dish3])
    end
  end
end
