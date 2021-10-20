require 'rails_helper'

RSpec.describe 'Restaurant Dishes Index' do
  describe 'when i visit a Restaurant Dishes Index page' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create(name: 'bbb', seasonal: true, calories: 450, restaurant_id: @restaurant1.id)
      @dish2 = Dish.create(name: 'aaa', seasonal: true, calories: 300, restaurant_id: @restaurant1.id)
      @dish3 = Dish.create(name: 'ccc', seasonal: true, calories: 950, restaurant_id: @restaurant1.id)

      visit "/restaurants/#{@restaurant1.id}/dishes/new"
    end

    it 'i fill out the form and a new dish is created, and redirect to restuarant dishes index' do
      fill_in 'Name', with: 'Burrito'
      fill_in 'Seasonal (true/false)', with: 'false'
      fill_in 'Calories', with: '1200'
      click_button 'Create New Dish'

      expect(current_path).to eq("/restaurants/#{@restaurant1.id}/dishes")
      expect(@restaurant1.dishes.count).to eq(4)
    end

    it 'i fill out the form incorrectly and am redirected back to new page' do
      fill_in 'Name', with: ''
      fill_in 'Seasonal (true/false)', with: 'false'
      fill_in 'Calories', with: '1200'
      click_button 'Create New Dish'

      expect(current_path).to eq("/restaurants/#{@restaurant1.id}/dishes/new")
      expect(@restaurant1.dishes.count).to eq(3)
    end
  end
end
