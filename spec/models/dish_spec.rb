require 'rails_helper'

describe Dish do
  describe 'relationships' do
    it { should belong_to :restaurant }
  end
end