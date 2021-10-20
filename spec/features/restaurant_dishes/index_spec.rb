require 'rails_helper'

RSpec.describe 'Restaurant Dishes Index' do
  describe 'when i visit a Restaurant Dishes Index page' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create(name: 'bbb', seasonal: true, calories: 450, restaurant_id: @restaurant1.id)
      @dish2 = Dish.create(name: 'aaa', seasonal: true, calories: 300, restaurant_id: @restaurant1.id)
      @dish3 = Dish.create(name: 'ccc', seasonal: true, calories: 950, restaurant_id: @restaurant1.id)

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

    it 'i see a link to update each dish' do
      click_link "Edit #{@dish1.name}"
      expect(current_path).to eq("/dishes/#{@dish1.id}/edit")
    end

    it 'i see a link to sort dishes in alphabetical order' do
      click_link 'Sort Alphabetically'

      expect(@dish2.name).to appear_before(@dish1.name, only_text: true)
      expect(@dish1.name).to appear_before(@dish3.name, only_text: true)
    end

    it 'i see a link next to every dish to delete it' do
      click_link "Delete #{@dish1.name}"

      expect(page).to_not have_content(@dish1.name)
      expect(page).to have_content(@dish2.name)
      expect(page).to have_content(@dish3.name)
    end

    it 'has a form to select threshold calories to display dish' do
      fill_in :calories, with: '400'
      click_button 'Apply'

      expect(page).to_not have_content(@dish2.name)
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish3.name)
    end
  end
end
