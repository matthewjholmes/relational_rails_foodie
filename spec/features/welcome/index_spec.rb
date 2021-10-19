require 'rails_helper'
###REMINDER TO MAKE NAV BAR###
RSpec.describe 'welcome index page' do
  before do
    visit '/'
  end

  it 'has project title' do
    expect(page).to have_content("Foodie, A Relational Rails Exploration")
  end

  it 'has link to restaurants' do
    click_link 'Restaurants'
    expect(current_path).to eq('/restaurants')
  end

  it 'has link to farmers_markets' do
    click_link 'Farmers Markets'
    expect(current_path).to eq('/farmers_markets')
  end

  it 'has link to dishes' do
    click_link 'Dishes'
    expect(current_path).to eq('/dishes')
  end

  it 'has link to produces' do
    click_link 'Produce'
    expect(current_path).to eq('/produces')
  end

end
