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

  it 'i see a link to add a new produce' do
    click_link 'Create New Produce'
    expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/produces/new")
  end

  it 'i see a link to sort alphabetically' do
    click_link 'Sort Alphabetically'
    expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/produces")
    expect(@produce2.name).to appear_before(@produce1.name)
    expect(@produce1.name).to appear_before(@produce3.name)
  end

  it 'i fill out the form and a new produce is created, and redirect to farmers_market produce index' do
    click_link 'Create New Produce'
    fill_in 'Name', with: 'Potatoes'
    fill_in 'Seasonal (true/false)', with: 'false'
    fill_in 'Quantity', with: '2000'
    click_button 'Create New Produce'

    expect(current_path).to eq("/farmers_markets/#{@farmers_market1.id}/produces")
    expect(@farmers_market1.produces.count).to eq(4)
  end

  it 'has a form to select threshold quantity to display produce' do
    fill_in :quantity, with: '170'
    click_button 'Apply'

    expect(page).to_not have_content(@produce1.name)
    expect(page).to have_content(@produce2.name)
    expect(page).to have_content(@produce3.name)
  end
end
