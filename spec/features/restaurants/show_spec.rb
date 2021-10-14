require 'rails_helper'

RSpec.describe 'restaurant show page' do
  describe 'when i visit a restaurant show page' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create(name: 'Soup', seasonal: true, calories: 450, restaurant_id: @restaurant1.id)
      @dish2 = Dish.create(name: 'Salad', seasonal: true, calories: 300, restaurant_id: @restaurant1.id)
      @dish3 = Dish.create(name: 'Sandwich', seasonal: false, calories: 950, restaurant_id: @restaurant1.id)

      visit "/restaurants/#{@restaurant1.id}"
    end

    it 'i see the restaurants with their attributes' do
      expect(page).to have_content(@restaurant1.name)
      expect(page).to have_content(@restaurant1.dine_in)
      expect(page).to have_content(@restaurant1.rating)
    end

    it 'i see a count of the dishes for this restaurant' do
      expect(page).to have_content("Dishes offered: 3")
    end
  end
end
