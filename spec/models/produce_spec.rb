require 'rails_helper'

describe Produce do
  describe 'relationships' do
    it { should belong_to :farmers_market }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    # it { is_expected.to validate_inclusion_of(:seasonal).in_array([true, false]) }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :farmers_market_id }
  end

  describe 'model methods' do
    before do
      farmers_market1 = FarmersMarket.create(name: "Veg Garden", local: true , vendor_count: 12)

      @produce1 = Produce.create(name: "Onions", seasonal: true, quantity: 160, farmers_market_id: farmers_market1.id)
      @produce2 = Produce.create(name: "Mushrooms", seasonal: false, quantity: 180, farmers_market_id: farmers_market1.id)
      @produce3 = Produce.create(name: "Peppers", seasonal: true, quantity: 200, farmers_market_id: farmers_market1.id)
    end

    it 'can return only seasonal produce' do
      expect(Produce.seasonal_filter).to eq([@produce1, @produce3])
    end

    it 'can order by most recent creation' do
      expect(Produce.order_by_most_recent_creation).to eq([@produce3, @produce2, @produce1])
    end
  end
end
