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

    it 'i fill in the form with farmers market attributes and a new record is created' do
      click_link 'Create New Farmers Market'
      fill_in 'Name', with: 'Local Market'
      fill_in 'Local', with: 'true'
      fill_in 'Vendor Count', with: '20'
      click_button 'Submit'

      expect(current_path).to eq('/farmers_markets')
      expect(FarmersMarket.count).to eq(4)
    end

    it 'i see a link to edit the market' do
      click_link "Edit #{@farmers_market1.name}"
      expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/edit")
    end
  end
end
