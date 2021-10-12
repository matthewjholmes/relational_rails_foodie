require 'rails_helper'

describe FarmersMarket do
  describe 'relationships' do
    it { should have_many :produces }
  end 
end