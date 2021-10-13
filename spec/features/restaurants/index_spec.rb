require 'rails_helper'

RSpec.describe 'restaurant index' do
  describe 'when i visit /restaurants' do
    before do
      # Edge case: what's up with boolean = false making record not appear on Restaurant.all
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @restaurant2 = Restaurant.create(name: "Rails", dine_in: true, rating: 1)
      @restaurant3 = Restaurant.create(name: "SQooL", dine_in: true, rating: 3)

      visit '/restaurants'
    end

    it 'i see the name of each restaurant' do
      expect(page).to have_content(@restaurant1.name)
      expect(page).to have_content(@restaurant2.name)
      expect(page).to have_content(@restaurant3.name)
    end
  end
end
