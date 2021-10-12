require 'rails_helper'

describe Produce do
  describe 'relationships' do
    it { should belong_to :farmers_market }
  end
end 