require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'when i visit a dish show page' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @dish1 = Dish.create(name: 'Soup', seasonal: true, calories: 450, restaurant_id: @restaurant1.id)

      visit "/dishes/#{@dish1.id}/edit"
    end

    it 'i fill in form and am redirected to updated show page' do
      fill_in 'Name', with: 'Tomato Soup'
      fill_in 'Seasonal (true/false)', with: 'false'
      fill_in 'Calories', with: '450'
      click_button 'Update Dish'

      expect(current_path).to eq("/dishes/#{@dish1.id}")
      expect(Dish.count).to eq(1)
    end

    it 'i fill in form and am redirected to updated show page' do
      fill_in 'Name', with: ''
      fill_in 'Seasonal (true/false)', with: 'false'
      fill_in 'Calories', with: '450'
      click_button 'Update Dish'

      expect(current_path).to eq("/dishes/#{@dish1.id}/edit")
      expect(Dish.count).to eq(1)
    end
  end
end
