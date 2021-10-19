require 'rails_helper'

describe FarmersMarket do
  describe 'relationships' do
    it { should have_many :produces }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { is_expected.to validate_inclusion_of(:local).in_array([true, false]) }
    it { should validate_presence_of :vendor_count }
  end

  describe 'model methods' do
    before do
      @farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)
      @produce1 = Produce.create(name: "Onions", seasonal: false, quantity: 160, farmers_market_id: @farmers_market1.id)
      @produce2 = Produce.create(name: "Mushrooms", seasonal: false, quantity: 180, farmers_market_id: @farmers_market1.id)
      @produce3 = Produce.create(name: "Peppers", seasonal: false, quantity: 200, farmers_market_id: @farmers_market1.id)
    end

    it 'can count the number of produce' do
      expect(@farmers_market1.produce_count).to eq(3)
    end

    it 'can order dishes alphabetically' do
      expect(@farmers_market1.alphabetical_produces).to eq([@produce2, @produce1, @produce3])
    end

    it 'can filter based on quantity' do
      expect(@farmers_market1.quantity_filter(170)).to eq([@produce2, @produce3])
    end
  end
end
