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

    it 'i see a link to the markets produce' do
      within "#links" do
        click_link 'Produce'
        expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/produces")
      end
    end

    it 'i see a link to update farmers_market' do
      within "#links" do
        click_link 'Update Farmers Market'
        expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/edit")
      end
    end

    it 'i see a link to delete farmers market' do
      click_link "Delete #{@farmers_market1.name}"

      expect(current_path).to eq("/farmers_markets")
      expect(page).to_not have_content(@farmers_market1.name)
    end
  end
end
