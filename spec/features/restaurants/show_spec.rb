require 'rails_helper'

RSpec.describe 'restaurant show page' do
  describe 'when i visit a restaurant show page' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)

      visit "/restaurants/#{@restaurant1.id}"
    end

    it 'i see the restaurants with their attributes' do
      expect(page).to have_content(@restaurant1.name)
      expect(page).to have_content(@restaurant1.dine_in)
      expect(page).to have_content(@restaurant1.rating)
    end
  end
end