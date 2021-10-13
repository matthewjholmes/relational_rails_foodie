require 'rails_helper'

describe FarmersMarket do
  describe 'relationships' do
    it { should have_many :produces }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :local }
    it { should validate_presence_of :vendor_count }
  end
end
