require 'rails_helper'

RSpec.describe 'Restaurant Dishes Index' do
  describe 'when i visit a Restaurant Dishes Index page' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create(name: 'b', seasonal: true, calories: 450, restaurant_id: @restaurant1.id)
      @dish2 = Dish.create(name: 'a', seasonal: true, calories: 300, restaurant_id: @restaurant1.id)
      @dish3 = Dish.create(name: 'c', seasonal: true, calories: 950, restaurant_id: @restaurant1.id)

      visit "/restaurants/#{@restaurant1.id}/dishes"
    end

    it 'i see each dish with attributes associated with restaurant' do
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.seasonal)
      expect(page).to have_content(@dish1.calories)
      expect(page).to have_content(@dish1.restaurant_id)

      expect(page).to have_content(@dish2.name)
      expect(page).to have_content(@dish2.seasonal)
      expect(page).to have_content(@dish2.calories)
      expect(page).to have_content(@dish2.restaurant_id)

      expect(page).to have_content(@dish3.name)
      expect(page).to have_content(@dish3.seasonal)
      expect(page).to have_content(@dish3.calories)
      expect(page).to have_content(@dish3.restaurant_id)
    end

    it 'i see a link to add a new dish' do
      click_link 'Create New Dish'
      expect(current_path).to eq("/restaurants/#{@restaurant1.id}/dishes/new")
    end

    it 'i fill out the form and a new dish is created, and redirect to restuarant dishes index' do
      click_link 'Create New Dish'
      fill_in 'Name', with: 'Burrito'
      fill_in 'Seasonal (true/false)', with: 'false'
      fill_in 'Calories', with: '1200'
      click_button 'Create New Dish'

      expect(current_path).to eq("/restaurants/#{@restaurant1.id}/dishes")
      expect(@restaurant1.dishes.count).to eq(4)
    end


    xit 'i see a link to sort dishes in alphabetical order' do
      click_link 'Sort Alphabetically'


      # expect(current_path).to eq("/restaurants/#{@restaurant1.id}/dishes")
      visit "/restaurants/#{@restaurant1.id}/dishes?sort=alphabetical"
      expect(@dish2.name).to appear_before(@dish1)
      expect(@dish1.name).to appear_before(@dish3)
    end
  end
end
