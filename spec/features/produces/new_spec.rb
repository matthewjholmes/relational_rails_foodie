require 'rails_helper'

RSpec.describe 'Farmers Market Produces Index' do
  before do
    @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
    @produce1 = Produce.create(name: "Onions", seasonal: true, quantity: 160, farmers_market_id: @farmers_market1.id)
    @produce2 = Produce.create(name: "Mushrooms", seasonal: false, quantity: 180, farmers_market_id: @farmers_market1.id)
    @produce3 = Produce.create(name: "Peppers", seasonal: true, quantity: 200, farmers_market_id: @farmers_market1.id)

    visit "/farmers_markets/#{@farmers_market1.id}/produces/new"
  end

  it 'i fill out the form and a new produce is created, and redirect to farmers_market produce index' do
    fill_in 'Name', with: 'Potatoes'
    fill_in 'Seasonal (true/false)', with: 'false'
    fill_in 'Quantity', with: '2000'
    click_button 'Create New Produce'

    expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/produces")
    expect(@farmers_market1.produces.count).to eq(4)
  end

  it 'i fill out the form incorrectly and am redirected to new page' do
    fill_in 'Name', with: ''
    fill_in 'Seasonal (true/false)', with: 'false'
    fill_in 'Quantity', with: '2000'
    click_button 'Create New Produce'

    expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/produces/new")
    expect(@farmers_market1.produces.count).to eq(3)
  end

end
