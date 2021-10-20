require 'rails_helper'

RSpec.describe 'farmers_market index' do
  describe 'when i visit /farmers_markets' do
    before do
      # Edge case: what's up with boolean = false making record not appear on Restaurant.all
      @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
      @farmers_market2 = FarmersMarket.create(name: "Megan's Market", local: false , vendor_count: 20)
      @farmers_market3 = FarmersMarket.create(name: "Dao Grain", local: true , vendor_count: 1)

      visit '/farmers_markets/new'
    end

    it 'i fill in the form with farmers market attributes and a new record is created' do
      fill_in 'Name', with: 'Local Market'
      fill_in 'Local', with: 'true'
      fill_in 'Vendor Count', with: '20'
      click_button 'Submit'

      expect(current_path).to eq('/farmers_markets')
      expect(FarmersMarket.count).to eq(4)
    end

    it 'i fill in the form incorrectly and am redirected back to new page' do
      fill_in 'Name', with: ''
      fill_in 'Local', with: 'true'
      fill_in 'Vendor Count', with: '20'
      click_button 'Submit'

      expect(current_path).to eq('/farmers_markets/new')
      expect(FarmersMarket.count).to eq(3)
    end
  end
end
