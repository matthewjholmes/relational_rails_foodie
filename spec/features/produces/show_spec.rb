require 'rails_helper'

RSpec.describe 'produce show page' do
  describe 'when i visit a produce show page' do
    before do
      farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
      @produce1 = Produce.create(name: "Onions", seasonal: true, quantity: 160, farmers_market_id: farmers_market1.id)

      visit "/produces/#{@produce1.id}"
    end

    it 'i see produce with its attributes' do
      expect(page).to have_content(@produce1.name)
      expect(page).to have_content(@produce1.seasonal)
      expect(page).to have_content(@produce1.quantity)
      expect(page).to have_content(@produce1.farmers_market_id)
    end

    
  end
end
