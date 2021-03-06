require 'rails_helper'

RSpec.describe 'farmers market show page' do
  describe 'when i visit a farmers market show page' do
    before do
      @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
      @produce1 = Produce.create(name: "Onions", seasonal: false, quantity: 160, farmers_market_id: @farmers_market1.id)
      @produce2 = Produce.create(name: "Mushrooms", seasonal: false, quantity: 180, farmers_market_id: @farmers_market1.id)
      @produce3 = Produce.create(name: "Peppers", seasonal: false, quantity: 200, farmers_market_id: @farmers_market1.id)

      visit "/farmers_markets/#{@farmers_market1.id}/edit"
    end

    it 'i fill out form with updates and am redirected to the updated show page' do
      fill_in 'Name', with: 'Local Market'
      fill_in 'Local', with: 'true'
      fill_in 'Vendor Count', with: '20'
      click_button 'Submit'

      expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}")
    end

    it 'i fill out form incorrectly and am redirected back to edit page' do
      fill_in 'Name', with: ''
      fill_in 'Local', with: 'true'
      fill_in 'Vendor Count', with: '20'
      click_button 'Submit'

      expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/edit")
    end
  end
end
