require 'rails_helper'

RSpec.describe 'restaurant index' do
  describe 'when i visit /restaurants' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @restaurant2 = Restaurant.create(name: "Rails", dine_in: false, rating: 1)
      @restaurant3 = Restaurant.create(name: "SQooL", dine_in: true, rating: 3)

      visit '/restaurants/new'
    end

    it 'i fill in the form with restaurant attributes and a new record is created' do
      fill_in 'Name', with: 'Cabybara'
      fill_in 'Dine In (true/false)', with: 'true'
      fill_in 'Rating', with: '4'
      click_button 'Submit'

      expect(current_path).to eq('/restaurants')
      expect(Restaurant.count).to eq(4)
    end

    it 'i fill in the form incorrectly and am redirected back to new page' do
      fill_in 'Name', with: ''
      fill_in 'Dine In (true/false)', with: 'true'
      fill_in 'Rating', with: '4'
      click_button 'Submit'

      expect(current_path).to eq('/restaurants/new')
      expect(Restaurant.count).to eq(3)
    end
  end
end
