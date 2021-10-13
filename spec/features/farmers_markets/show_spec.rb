require 'rails_helper'

RSpec.describe 'farmers market show page' do
  describe 'when i visit a farmers market show page' do
    before do
      @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)

      visit "/farmers_markets/#{@farmers_market1.id}"
    end

    it 'i see the farmers_markets with their attributes' do
      expect(page).to have_content(@farmers_market1.name)
      expect(page).to have_content(@farmers_market1.local)
      expect(page).to have_content(@farmers_market1.vendor_count)
    end
  end
end