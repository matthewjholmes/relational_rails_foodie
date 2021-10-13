require 'rails_helper'

describe Restaurant do
  describe 'relationships' do
    it { should have_many :dishes }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :dine_in }
    it { should validate_presence_of :rating }
  end
end
