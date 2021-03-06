require 'rails_helper'

RSpec.describe 'farmers_market index' do
  describe 'when i visit /farmers_markets' do
    before do
      # Edge case: what's up with boolean = false making record not appear on Restaurant.all
      @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
      @farmers_market2 = FarmersMarket.create(name: "Megan's Market", local: false , vendor_count: 20)
      @farmers_market3 = FarmersMarket.create(name: "Dao Grain", local: true , vendor_count: 1)

      visit '/farmers_markets'
    end

    it 'i see the name of each farmers_market' do
      expect(page).to have_content(@farmers_market1.name)
      expect(page).to have_content(@farmers_market2.name)
      expect(page).to have_content(@farmers_market3.name)
    end

    it 'markets are ordered by most recent creation' do
      expect(@farmers_market3.name).to appear_before(@farmers_market2.name)
      expect(@farmers_market2.name).to appear_before(@farmers_market1.name)
    end

    it 'i see a link to create a new farmers market' do
      click_link 'Create New Farmers Market'

      expect(current_path).to eq('/farmers_markets/new')
    end

    it 'i see a link to edit the market' do
      within "#farmers-market-#{@farmers_market1.id}" do
        click_link "Edit"
        expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/edit")
      end
    end

    it 'i see a link next to every farmers market to delete it' do
      within "#farmers-market-#{@farmers_market1.id}" do
        click_link "Delete"

        expect(current_path).to eq('/farmers_markets')
      end
      expect(page).to_not have_content(@farmers_market1.name)
      expect(page).to have_content(@farmers_market2.name)
      expect(page).to have_content(@farmers_market3.name)
    end
  end
end
