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

    it 'i see a link to restaurant dishes' do
      click_link 'Dishes'
      expect(current_path).to eq("/restaurants/#{@restaurant1.id}/dishes")
    end

    it 'i see a link to update restaurant' do
      click_link 'Update Restaurant'
      expect(current_path).to eq("/restaurants/#{@restaurant1.id}/edit")
    end

    it 'i fill out form with updates and am redirected to the updated show page' do
      click_link 'Update Restaurant'
      fill_in 'Name', with: 'Cabybara'
      fill_in 'Dine In (true/false)', with: 'true'
      fill_in 'Rating', with: '4'
      click_button 'Submit'

      expect(current_path).to eq("/restaurants/#{@restaurant1.id}")
    end

    it 'i see a link to delete restaurant' do
      click_link "Delete #{@restaurant1.name}"

      expect(current_path).to eq("/restaurants")
      expect(page).to_not have_content(@restaurant1.name)
    end
  end
end
