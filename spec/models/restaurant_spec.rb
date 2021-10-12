require 'rails_helper'

describe Restaurant do
  describe 'relationships' do
    it { should have_many :dishes }
  end
end