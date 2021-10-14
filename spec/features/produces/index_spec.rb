require 'rails_helper'

RSpec.describe 'Produce Index' do
  before do
    farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)

    @produce1 = Produce.create(name: "Onions", seasonal: true, quantity: 160, farmers_market_id: farmers_market1.id)
    @produce2 = Produce.create(name: "Mushrooms", seasonal: true, quantity: 180, farmers_market_id: farmers_market1.id)
    @produce3 = Produce.create(name: "Peppers", seasonal: true, quantity: 200, farmers_market_id: farmers_market1.id)

    visit '/produces'
  end

  it 'i see each produce in the system with attributes' do
    # within "produce-#{@produce1.id}" do
      expect(page).to have_content(@produce1.name)
      expect(page).to have_content(@produce1.seasonal)
      expect(page).to have_content(@produce1.quantity)
      expect(page).to have_content(@produce1.farmers_market_id)
    # end

    # within "produce-#{@produce2.id}" do
      expect(page).to have_content(@produce2.name)
      expect(page).to have_content(@produce2.seasonal)
      expect(page).to have_content(@produce2.quantity)
      expect(page).to have_content(@produce2.farmers_market_id)
    # end

    # within "produce-#{@produce3.id}" do
      expect(page).to have_content(@produce3.name)
      expect(page).to have_content(@produce3.seasonal)
      expect(page).to have_content(@produce3.quantity)
      expect(page).to have_content(@produce3.farmers_market_id)
    # end
  end
end
