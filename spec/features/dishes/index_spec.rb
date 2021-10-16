require 'rails_helper'

RSpec.describe 'Dishes Index' do
  before do
    restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)

    @dish1 = Dish.create(name: 'Soup', seasonal: true, calories: 450, restaurant_id: restaurant1.id)
    @dish2 = Dish.create(name: 'Salad', seasonal: true, calories: 300, restaurant_id: restaurant1.id)
    @dish3 = Dish.create(name: 'Sandwich', seasonal: false, calories: 950, restaurant_id: restaurant1.id)

    visit '/dishes'
  end

  it 'i see each dish in the system with attributes' do
    within "#dish-#{@dish1.id}" do
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.seasonal)
      expect(page).to have_content(@dish1.calories)
      expect(page).to have_content(@dish1.restaurant_id)
    end

    within "#dish-#{@dish2.id}" do
      expect(page).to have_content(@dish2.name)
      expect(page).to have_content(@dish2.seasonal)
      expect(page).to have_content(@dish2.calories)
      expect(page).to have_content(@dish2.restaurant_id)
    end
  end

  it 'only shows seasonal dishes(boolean = true)' do
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish2.name)
    expect(page).to_not have_content(@dish3.name)
  end

  it 'i see a link to update each dish' do
    click_link "Edit #{@dish1.name}"
    expect(current_path).to eq("/dishes/#{@dish1.id}/edit")
  end

  it 'i see a link next to every dish to delete it' do
    click_link "Delete #{@dish1.name}"

    expect(current_path).to eq('/dishes')
    expect(page).to_not have_content(@dish1.name)
    expect(page).to have_content(@dish2.name)
    expect(page).to have_content(@dish3.name)
  end
end
