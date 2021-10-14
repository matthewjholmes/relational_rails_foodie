require 'rails_helper'

RSpec.describe 'Farmers Market Produces Index' do
  before do
    @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
    @produce1 = Produce.create(name: "Onions", seasonal: true, quantity: 160, farmers_market_id: @farmers_market1.id)
    @produce2 = Produce.create(name: "Mushrooms", seasonal: false, quantity: 180, farmers_market_id: @farmers_market1.id)
    @produce3 = Produce.create(name: "Peppers", seasonal: true, quantity: 200, farmers_market_id: @farmers_market1.id)

    visit "/farmers_markets/#{@farmers_market1.id}/produces"
  end

  it 'i see each produce with attributes associated with farmers market' do
    expect(page).to have_content(@produce1.name)
    expect(page).to have_content(@produce1.seasonal)
    expect(page).to have_content(@produce1.quantity)
    expect(page).to have_content(@produce1.farmers_market_id)

    expect(page).to have_content(@produce2.name)
    expect(page).to have_content(@produce2.seasonal)
    expect(page).to have_content(@produce2.quantity)
    expect(page).to have_content(@produce2.farmers_market_id)

    expect(page).to have_content(@produce3.name)
    expect(page).to have_content(@produce3.seasonal)
    expect(page).to have_content(@produce3.quantity)
    expect(page).to have_content(@produce3.farmers_market_id)
  end
end
