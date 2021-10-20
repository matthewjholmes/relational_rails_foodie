require 'rails_helper'

RSpec.describe 'restaurant index' do
  describe 'when i visit /restaurants' do
    before do
      @restaurant1 = Restaurant.create(name: "Jameson's", dine_in: true, rating: 5)
      @restaurant2 = Restaurant.create(name: "Rails", dine_in: false, rating: 1)
      @restaurant3 = Restaurant.create(name: "SQooL", dine_in: true, rating: 3)

      visit '/restaurants'
    end

    it 'i see the name of each restaurant' do
      expect(page).to have_content(@restaurant1.name)
      expect(page).to have_content(@restaurant2.name)
      expect(page).to have_content(@restaurant3.name)
    end

    it 'i see the restaurants ordered by most recently created' do
      expect(@restaurant3.name).to appear_before(@restaurant2.name)
      expect(@restaurant2.name).to appear_before(@restaurant1.name)
    end

    it 'i see a link to create a new restaurant' do
      click_link 'Create New Restaurant'

      expect(current_path).to eq('/restaurants/new')
    end

    it 'i see a link to edit the restaurant' do
      within "#restaurant-#{@restaurant1.id}" do
        click_link "Edit"
        expect(current_path).to eq("/restaurants/#{@restaurant1.id}/edit")
      end
    end

    it 'i see a link next to every restaurant to delete it' do
      within "#restaurant-#{@restaurant1.id}" do
        click_link "Delete"

        expect(current_path).to eq('/restaurants')
      end
      expect(page).to_not have_content(@restaurant1.name)
      expect(page).to have_content(@restaurant2.name)
      expect(page).to have_content(@restaurant3.name)
    end
  end
end
