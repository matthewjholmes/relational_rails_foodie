require 'rails_helper'

describe Produce do
  describe 'relationships' do
    it { should belong_to :farmers_market }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :farmers_market_id }
  end
end
