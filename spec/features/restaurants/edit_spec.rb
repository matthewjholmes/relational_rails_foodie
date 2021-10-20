require 'rails_helper'

RSpec.describe 'restaurant show page' do
  describe 'when i visit a restaurant show page' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create(name: 'Soup', seasonal: true, calories: 450, restaurant_id: @restaurant1.id)
      @dish2 = Dish.create(name: 'Salad', seasonal: true, calories: 300, restaurant_id: @restaurant1.id)
      @dish3 = Dish.create(name: 'Sandwich', seasonal: false, calories: 950, restaurant_id: @restaurant1.id)

      visit "/restaurants/#{@restaurant1.id}/edit"
    end

    it 'i fill out form with updates and am redirected to the updated show page' do
      fill_in 'Name', with: 'Cabybara'
      fill_in 'Dine In (true/false)', with: 'true'
      fill_in 'Rating', with: '4'
      click_button 'Submit'

      expect(current_path).to eq("/restaurants/#{@restaurant1.id}")
    end

    it 'i fill out form incorrectly and am redirected to edit page' do
      fill_in 'Name', with: ''
      fill_in 'Dine In (true/false)', with: 'true'
      fill_in 'Rating', with: '4'
      click_button 'Submit'

      expect(current_path).to eq("/restaurants/#{@restaurant1.id}/edit")
    end

  end
end
