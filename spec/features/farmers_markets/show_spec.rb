require 'rails_helper'

RSpec.describe 'farmers market show page' do
  describe 'when i visit a farmers market show page' do
    before do
      @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
      @produce1 = Produce.create(name: "Onions", seasonal: false, quantity: 160, farmers_market_id: @farmers_market1.id)
      @produce2 = Produce.create(name: "Mushrooms", seasonal: false, quantity: 180, farmers_market_id: @farmers_market1.id)
      @produce3 = Produce.create(name: "Peppers", seasonal: false, quantity: 200, farmers_market_id: @farmers_market1.id)

      visit "/farmers_markets/#{@farmers_market1.id}"
    end

    it 'i see the farmers_markets with their attributes' do
      expect(page).to have_content(@farmers_market1.name)
      expect(page).to have_content(@farmers_market1.local)
      expect(page).to have_content(@farmers_market1.vendor_count)
    end

    it 'i see the number of produces for the market' do
      expect(page).to have_content("Produce variety: 3")
    end
  end
end
