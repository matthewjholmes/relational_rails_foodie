require 'rails_helper'

describe Dish do

  describe 'relationships' do
    it { should belong_to :restaurant }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
    it { should validate_presence_of :restaurant_id }
  end
end
